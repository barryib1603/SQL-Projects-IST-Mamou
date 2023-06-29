create database BD_competition;
-----suppression de la base de donnée
drop database BD_competition;
----creation d'une nouvelle BD
create database BD_COMPT;
----connexion à la base deonnée
use BD_COMPT;
----creation des tables
create table DEPARTEMENT(id_dept int primary key,nom char(25),chef char(25));
create table EQUIPES(id_eqp int primary key,nom char(25),prime int);
create table JOUEUR(mat int primary key, nom char(25),prenom char(25),datenais date,tel char(60),poste char(25),fonction char(25));
create table ARBITRE(num int primary key,nom char(25));
create table RENCONTRE(id_ren int primary key,nom char(25),date_ren date,but1 int,but2 int,stade char(25));
----immigration des cles
alter table JOUEUR add id_dept int;
alter table JOUEUR add constraint fk_id_dept foreign key(id_dept) references DEPARTEMENT(id_dept); 
alter table EQUIPES add id_dept int;
alter table EQUIPES add constraint fk_id foreign key(id_dept) references DEPARTEMENT(id_dept); 
alter table RENCONTRE add id_eqp1 int;
alter table RENCONTRE add id_eqp2 int;
alter table RENCONTRE add constraint fk_id_eqp foreign key(id_eqp1) references EQUIPES(id_eqp); 
alter table RENCONTRE add constraint fk_id_eqp2 foreign key(id_eqp2) references EQUIPES(id_eqp); 
alter table RENCONTRE add num int;
alter table RENCONTRE add constraint fk_num foreign key(num) references ARBITRE(num); 
alter table JOUEUR add constraint fk_mat foreign key(mat) references JOUEUR(mat); 
select * from JOUEUR
------ALIMENTATIONS DES TBLES
-----------table departement
insert into DEPARTEMENT values(1,'GENIEINFNO','kaba');
insert into DEPARTEMENT values(2,'ENERGETIQUE','Camra');
insert into DEPARTEMENT values(3,'LABORATOIRE','Kebe');
insert into DEPARTEMENT values(4,'CFM','kolomou');
insert into DEPARTEMENT values(5,'IMP','Haba');
insert into DEPARTEMENT values(6,'TEB','Loua');
---table equipe
insert into EQUIPES values(1,'GINFO',8000000,1);
insert into EQUIPES values(2,'ENERIE',7000000,2);
insert into EQUIPES values(3,'LABO',6500000,3);
insert into EQUIPES values(4,'CFM',5500000,4);
insert into EQUIPES values(5,'IMP',4000000,5);
insert into EQUIPES values(6,'TEB',7500000,6)
SELECT * from EQUIPES
-----table arbitre
insert into ARBITRE values(1,'Condé');
insert into ARBITRE values(2,'Mansaré');
insert into ARBITRE values(3,'Barry');
select * from ARBITRE;
----table joueurs
----table joueurs
----mes joueurs de genie informatique
insert into JOUEUR values(1,'Kaba','Mamoudou','1996/12/23','655 78 16 60','Defenseur','capitaine',1);
insert into JOUEUR values(2,'Kebe','Bintou','1995/11/01','666 78 16 60','Defenseur',' ',1);
insert into JOUEUR values(3,'Kolomou','Mathos','1996/04/15','654 70 00 60','Ataquant',' ',1);
insert into JOUEUR values(4,'Camara','Fatoumata','1996/04/21','657 78 16 60','Ataquante',' ',1);
insert into JOUEUR values(5,'Haba','Pierre','1996/12/23','656 70 16 33','Defenseur',' ',1);
insert into JOUEUR values(6,'Mansare','Mamoudou','1996/12/23','655 50 16 89','Defenseur',' ',1);
insert into JOUEUR values(7,'Keita','Bangaly','1996/12/23','631 31 32 60','Ataquant',' ',1);
insert into JOUEUR values(8,'Loua','Gbilimou','1994/01/01','661 57 88 77','Mileu',' ',1);
insert into JOUEUR values(9,'Fofana','Moussa','1997/04/11','622 00 47 58','Ataquant',' ',1);
insert into JOUEUR values(10,'Kolo','Ousmane','1998/12/23','620 12 13 12','Nfalan Droite',' ',1);
insert into JOUEUR values(11,'Diakité','Mory','1997/12/23','655 78 16 60','Ataquant',' ',1);
insert into JOUEUR values(12,'Théa','Paul','1988/08/08','655 78 16 60','Ataquant',' ',1);
insert into JOUEUR values(13,'Condé','Aly','1996/12/23','623 12 47 58','Gardien',' ',1);
insert into JOUEUR values(14,'Bangoura','Gadiri','1997/08/05','655 78 16 60','Gardien',' ',1);
insert into JOUEUR values(15,'Sow','Sanoussy','1995/12/23','660 12 47 58','Ataquant',' ',1);
insert into JOUEUR values(16,'Camara','Mohamed','1996/12/23','666 00 00 01','Ataquant',' ',1);
insert into JOUEUR values(17,'Ly','Yassine','1996/12/23','655 78 17 32','Nfalan Gauche',' ',1);
insert into JOUEUR values(18,'Dillo','Madou','1996/12/23','661 99 99 58','Central',' ',1);
insert into JOUEUR values(19,'Soumaoro','Solution','1996/12/23','655 78 16 60','Mileu',' ',1);
insert into JOUEUR values(20,'Soumah','Yamoussa','1996/12/23','655 78 16 60','Mileu',' ',1);
insert into JOUEUR values(21,'Doumbouya','Dramane','1996/12/23','622 00 47 58','Pointe',' ',1);
insert into JOUEUR values(22,'Keita','Djiaba','1996/12/23','622 00 14 25','NFalan',' ',1);
----les joueurs d'energetique
insert into JOUEUR values(23,'Diallo','Alpha','1996/08/23','655 78 16 60','Lateral','capitaine',2);
insert into JOUEUR values(24,'Baldé','Oumar','1995/11/01','666 78 16 60','Defenseur',' ',2);
insert into JOUEUR values(25,'Kalivogui','Mathos','1995/04/15','654 70 00 60','Ataquant',' ',2);
insert into JOUEUR values(26,'Koivogui','Lanciné','1996/04/21','657 78 16 60','Ataquante',' ',2);
insert into JOUEUR values(27,'Haba','Pierre','1995/08/23','656 70 16 88','Defenseur',' ',2);
insert into JOUEUR values(28,'Mansare','Mamoudou','1996/10/23','655 00 16 89','Defenseur',' ',2);
insert into JOUEUR values(29,'Keita','Bangaly','1996/10/23','621 01 00 29','Ataquant',' ',2);
insert into JOUEUR values(30,'Koivogui','Ben','1994/01/01','661 57 88 77','Mileu',' ',2);
insert into JOUEUR values(31,'Camara','Françcois','1997/04/11','622 00 47 58','Ataquant',' ',2);
insert into JOUEUR values(32,'Kolo','Ousmane','1995/07/31','620 12 13 12','Nfalan Droite',' ',2);
insert into JOUEUR values(33,'Diakité','Mory','1997/06/30','655 78 16 26','Ataquant',' ',2);
insert into JOUEUR values(34,'Théa','Paul','1988/11/08','655 78 16 77','Ataquant',' ',2);
insert into JOUEUR values(35,'Condé','Aly','1994/12/30','628 12 06 54','Gardien',' ',2);
insert into JOUEUR values(36,'Bah','Lamaranah','1997/08/05','655 78 16 60','Gardien',' ',2);
insert into JOUEUR values(37,'Sow','Sanoussy','1995/12/04','628 12 47 58','Ataquant',' ',2);
insert into JOUEUR values(38,'Camara','Mohamed','1996/12/01','666 00 00 01','Lateral',' ',2);
insert into JOUEUR values(39,'Ly','Yassine','1994/11/23','655 78 17 32','Nfalan Gauche',' ',2);
insert into JOUEUR values(40,'Diallo','Madou','1994/12/23','625 88 97 58','Central',' ',2);
insert into JOUEUR values(41,'Soumaoro','Solution','1996/12/23','655 78 16 36','Mileu',' ',2);
insert into JOUEUR values(42,'Kaba','Yamoussa','1994/12/23','655 98 16 98','Lateral',' ',2);
insert into JOUEUR values(43,'Sylla','Mamadouba','1997/02/11','622 00 47 58','Pointe',' ',2);
insert into JOUEUR values(44,'Keita','Djiaba','1997/11/15','622 41 41 25','NFalan',' ',2);
---autres joueurs d'autres departements
insert into JOUEUR values(45,'Kourouma','Mamady','1994/08/25','664 04 17 32','Nfalan Gauche','capitaine',3);
insert into JOUEUR values(46,'Diallo','Madiou','1994/12/23','620 39 49 59','Central','capitaine',4);
insert into JOUEUR values(47,'Lamah','Cecile','1996/12/23','654 78 16 36','Mileu','capitaine',5);
insert into JOUEUR values(48,'Kaba','Yamoussa','1996/12/23','633 90 17 98','Lateral',' ',6);
insert into JOUEUR values(49,'Sylla','Mamadouba','1995/08/29','622 00 47 58','Pointe','capitaine',6)
------------LES REQUETTES-------------
----Affichage de la listes des équipes en compétition
select EQUIPES.id_dept,EQUIPES.nom 
from EQUIPES;
-----Affichage de la liste des joueurs du departement GENIE_INFO
select JOUEUR.mat,JOUEUR.nom,JOUEUR.prenom,JOUEUR.datenais,
JOUEUR.tel,JOUEUR.poste,JOUEUR.fonction
from JOUEUR
where JOUEUR.id_dept='1';
----Comptage du nombre d'équipes en compétition
select COUNT(*) as Totale_Equipe from EQUIPES
-----Soit le match GENIEINFO VS ENERGIE
INSERT INTO RENCONTRE VALUES(1,'GENIEINFO VS ENERGIE','05-05-2016',3,1,'Stade_Teico',1,2,1);
select RENCONTRE.id_ren,RENCONTRE.date_ren,RENCONTRE.nom,RENCONTRE.but1,RENCONTRE.but2,
RENCONTRE.stade,ARBITRE.nom from RENCONTRE,ARBITRE
where RENCONTRE.num=ARBITRE.num;
-----Affichage de la liste des joueurs qui sont capitaines
select JOUEUR.nom,JOUEUR.prenom,JOUEUR.poste,JOUEUR.fonction from JOUEUR
where JOUEUR.fonction='capitaine';
----Suppression d'un joueur dans la table joueurs
DELETE FROM JOUEUR
WHERE mat='48';
select * from JOUEUR;
----Mettre à jour la table EQUIPE pour augmenter les primes à 50%
update EQUIPES
set prime=prime+prime*0.5;
select EQUIPES.prime from EQUIPES;