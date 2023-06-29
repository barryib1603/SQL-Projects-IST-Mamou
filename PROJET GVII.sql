----creation de la base de donnée personnel
create database personnel
---connexion à la base de donnée
use personnel
--suppression de la base de donnée
use master
drop database personnel
-------------------------------------------------------
--------------------------------------------------------
---creation de la base de donnée personnel_BD
create database personnel_BD
use personnel_BD
--creation des tables
create table employe(num int primary key,nom char(20),prenom char(25),fonction char(20),titre char(20),diplome char(20),salaire numeric,
telephone char(60))
--alimentation de la table services
create table conge(id_conge int primary key,observation char(30))
create table services(num_serv int primary key,nom_serv char(20),capacite int)
create table prise_conge(id_conge int,num int,date_debut date,date_fin date)
--alimentation de la table services
insert into services values(1,'chef_de_departement',6)
insert into services values(2,'directeur_general',1)
insert into services values(6,'chef_dept_adjoint',1)
insert into services values(3,'scolarite',2)
insert into services values(4,'surveillant',3)
insert into services values(5,'professeur',4)
--ajout des tables
alter table employe add num_serv int
alter table employe add supt int
--alimentation de la table congé
insert into conge values(1,'congé_academic')
insert into conge values(2,'cas_de_maladie')
insert into conge values(3,'cas_de_decès')
insert into conge values(4,'cas_social')
insert into conge values(5,'congé_reglementaire')
--creation des clées etrangères
alter table employe add constraint FK_numserv foreign key(num_serv) references services(num_serv)
alter table employe add constraint fk_supt foreign key(supt) references employe(num)
alter table prise_conge add constraint fk_num foreign key(num) references employe(num)
alter table prise_conge add constraint fk_id_conge foreign key(id_conge) references conge(id_conge)
--alimentation de la table employe
insert into employe values(1,'Kanté','Cellou','Directeur_general','Docteur','comptable','3500000','625 65 66 67',2,null)
insert into employe values(2,'Diallo','Djami','comptable','Licence','chimiste','800000','655 87 84 52',3,1)
insert into employe values(3,'Camara','Sekou','chef_departement','Docteur','physicien','1500000','664 44 45 46',1,1)
insert into employe values(4,'Condé','Aly badra','professeur','Master','developpeur','1000000','620 50 51 52',5,3)
insert into employe values(5,'Poindo','Sâa','DG_adjoint','Docteur','mathematicien','2000000','664 14 15 16',6,1)
insert into employe values(6,'Kebe','Souleymane','professeur','Licence','mathematicien','850000','655 10 11 12',5,3)
select * from employe
--alimentation de la table prise_conge
insert into prise_conge values(1,2,'1/01/2016','5/02/2016')
insert into prise_conge values(2,2,'1/01/2016','5/02/2016')
insert into prise_conge values(3,3,'1/12/2015','4/01/2016')
insert into prise_conge values(5,4,'5/02/2016','3/02/2016')
insert into prise_conge values(2,5,'10/12/2016','4/02/2016')
 
--affichage des services ayant une capacité superieur ou egale à 2 employés
select * from prise_conge
where capacite>=2
--affichage de la liste des employés ayant un titre de doctorat
select * from employe
where titre='Docteur'
--affichage de la liste des employés ayant un titre de Master
select * from employe
where titre='Master'
--affichage de la liste des employés ayant un titre de BTS
select * from employe
where titre='BTS'
--affichage des employés ayant pris congé un congé pour une periode allant du 01/01/2016 au 01/03/2016
select * from prise_conge
where year(date_debut) & year(date_fin) between year('1/01/2016') and  year('1/03/2016') 
--comptage du nombre d'employés par service
--service chef de departement
select count(num_serv) as Chef_de_departement from employe
where num_serv=1
--service de directeur general
select count(num_serv) as directeur_general from employe
where num_serv=2
--service de chef de departement adjoint
select count(num_serv) as scolarité from employe
where num_serv=3
--service de scolarité
select count(num_serv) as surveillants from employe
where num_serv=4
--NOMBRE DE PROF
select count(num_serv) as professeurs from employe
where num_serv=5
--service de professeur
select count(num_serv) as chef_dept_adjoint from services
where num_serv=6
--affichage de l'employé ayant le salaire maximal
select * from employe
where salaire=(select max(salaire) from employe)
------------------------------------------------------fin projet----------------------------------------------------------------------

