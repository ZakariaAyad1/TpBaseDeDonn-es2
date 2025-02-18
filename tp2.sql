-- q1

create table livre (
   num_livre   int primary key,
   titre       varchar(255),
   auteur      varchar(255),
   nbre_exempl int
);

create table abonne (
   num_abonne int primary key,
   nom        varchar(255),
   prenom     varchar(255)
);

create table pret (
   num_livre  int,
   num_abonne int,
   date_pret  date,
   primary key ( num_livre,
                 num_abonne ),
   foreign key ( num_livre )
      references livre ( num_livre ),
   foreign key ( num_abonne )
      references abonne ( num_abonne )
);



--q2


insert into livre values ( 502,
                           'Bases De Données',
                           'Auteur 1',
                           3 );
insert into livre values ( 533,
                           'Algorithmes',
                           'Auteur 2',
                           5 );
insert into livre values ( 482,
                           'Langage Python',
                           'Auteur 3',
                           12 );
insert into livre values ( 578,
                           'Unix',
                           'Auteur 4',
                           11 );
insert into livre values ( 112,
                           'Programmation',
                           'Auteur 5',
                           5 );
insert into livre values ( 963,
                           'Langage C',
                           'Auteur 6',
                           9 );
insert into livre values ( 531,
                           'Systèmes Exploitations',
                           'Auteur 7',
                           8 );
insert into livre values ( 623,
                           'Langage Java',
                           'Auteur 8',
                           4 );


insert into abonne values ( 100,
                            'Ab11',
                            'Ab12' );
insert into abonne values ( 102,
                            'Ab21',
                            'Ab22' );
insert into abonne values ( 55,
                            'Ab31',
                            'Ab32' );
insert into abonne values ( 45,
                            'Ab41',
                            'Ab42' );
insert into abonne values ( 125,
                            'Ab51',
                            'Ab52' );

insert into pret values ( 502,
                          102,
                          to_date('2017-01-12','YYYY-MM-DD') );
insert into pret values ( 533,
                          100,
                          to_date('2017-05-15','YYYY-MM-DD') );
insert into pret values ( 502,
                          45,
                          to_date('2017-06-13','YYYY-MM-DD') );
insert into pret values ( 112,
                          125,
                          to_date('2017-07-01','YYYY-MM-DD') );
insert into pret values ( 533,
                          102,
                          to_date('2017-10-01','YYYY-MM-DD') );
insert into pret values ( 502,
                          55,
                          to_date('2017-10-02','YYYY-MM-DD') );
insert into pret values ( 963,
                          102,
                          to_date('2017-12-01','YYYY-MM-DD') );
insert into pret values ( 502,
                          125,
                          to_date('2018-01-03','YYYY-MM-DD') );
insert into pret values ( 112,
                          102,
                          to_date('2018-01-09','YYYY-MM-DD') );




-- 3.a

select *
  from livre;
select *
  from abonne;
select *
  from pret;


-- 3.b

select *
  from livre
 where nbre_exempl = 5;

-- 3.c

select *
  from livre
 where nbre_exempl between 5 and 11;


-- 3 .d

select *
  from livre
 where titre = 'Unix'
    or nbre_exempl between 5 and 11;

-- 3.e

select titre,
       nbre_exempl
  from livre;

-- 3.f

select titre,
       nbre_exempl,
       nbre_exempl + 3 as quantite_augmentee
  from livre;

-- 3.g

select distinct nbre_exempl
  from livre;


-- 3.h

select titre,
       nbre_exempl
  from livre
 where nbre_exempl > 8;

-- 3.i 

select titre,
       auteur
  from livre
 order by titre;

--3.j

select titre,
       auteur
  from livre
 where nbre_exempl > 8
 order by titre desc;

-- 3.k

select titre,
       auteur
  from livre
 where titre like 'L%';

-- 3.l

select titre,
       auteur
  from livre
 where titre like '_a%';


-- 3.m

select count(*) as nombre_livres
  from livre;


-- 3.n

select count(*) as nombre_livres
  from livre
 where nbre_exempl = 5;

-- 3.o

select count(*) as nombre_total_livres
  from livre;

--3.p

select num_livre,
       count(distinct num_abonne) as nombre_abonnes
  from pret
 group by num_livre;

-- 3.q

select num_livre,
       count(distinct num_abonne)
  from pret
 group by num_livre
having count(distinct num_abonne) > 3;


-- 3.r

select max(nbre_exempl) as quantite_max
  from livre;

-- 3.s

select *
  from livre
 where nbre_exempl = (
   select max(nbre_exempl)
     from livre
);