--- CREATION DE LA BASE BD_PRODUIT
create database BD_PRODUIT;
--- CONNEXION A LA BASE DE DONNEE BD_PRODUIT
USE BD_PRODUIT;
--- SUPPRESSION DE LA BASE DE DONNEE BD_PRODUIT
use master;
drop database BD_PRODUIT;
---	CREATION D'UNE NOUVELL BASE DE DONNEE PRODUIT_BD
create database PRODUIT_BD;
--- CREATION DES TABLES DE LA BASE
use PRODUIT_BD;
create table CLIENT(
Numcli int primary key not null,
NomCli varchar(25) not null,
PrenomCli varchar(40),
tel varchar(60)
);
create table COMMANDE (
NumCom int primary key,
DateCom date not null,
Livraison varchar(30),
NumCli int not null, 
);
create table PRODUIT (
CodeProd char(4) primary key not null,
NomProd varchar(25) not null,
PuProd numeric not null,
Categorie char(25) not null,
--- AJOUT DE LA CONTRAINTE POUR CATEGORIE DU PRODUIT (PHARMACEUTIQUE OU COSMETIQUE)
constraint ck_prod_cat check (Categorie in('Pharmaceutique','Cosmetique')),
);
create table LIGNE_COMMANDE (
IdLign_com int primary key,
Quantite numeric,
NumCom int not null,
CodeProd char(4) not null,
);
---  ALIMENTATION DES TABLES  DE LA BASE DE DONNEE
--- POUR LA TABLE PRODUIT
insert into PRODUIT values
('CL50','CLEARMAN',30000,'Cosmetique'),
('CI10','CIPROX',7000,'Pharmaceutique'),
('DO20','DOLIPRANE',20000,'Pharmaceutique'),
('PA30','PARACETAMOL',1000,'Pharmaceutique'),
('RA40','RAZAK',25000,'Cosmetique');
select * from PRODUIT;
--- POUR LA TABLE CLIENT
insert into CLIENT values
(1,'Camara', 'Mohamed','628-24-66-62'),
(2,'Doumbouya', 'Abdourahmane', '623-16-09-54'),
(3,'Toure', 'Salematou','654-07-87-56'),
(4,'Soumah', 'Yamoussa', '664-15-78-25'),
(5,'Traore', 'Mariam', '657-05-89-45');
select * from CLIENT
-- POUR LA TABLE COMMANDE
insert into COMMANDE values
(3,'17/04/2015','TELICO',5),
(5,'01/07/2015','ALMAMYA',1),
(8,'23/09/2015','ALMAMYA',1),
(7,'19/10/2015','KIMBELY',3),
(1,'01/01/2015','LOPPET',2),
(2,'04/03/2015','CONSERVERIE',4),
(4,'31/05/2015','POUDRIERE',4),
(6,'10/07/2015','CONSERVERIE',4);
SELECT * FROM COMMANDE;
-- POUR LA TABLE LIGNE_COMMANDE
insert into LIGNE_COMMANDE values
(1,5,1,'CL50'),
(2,1,2,'RA40'),
(3,10,2,'DO20'),
(4,200,3,'CL50'),
(5,525,4,'PA30'),
(6,50,4,'DO20'),
(7,75,4,'CI10'),
(8,20,5,'CI10'),
(9,75,6,'PA30'),
(10,25,6,'RA40'),
(11,10,7,'CL50'),
(12,33,8,'CI10');
select * from LIGNE_COMMANDE;
--- AJOUT DE LA  CONTRAINTE DE FOREIGN KEY A LA TABLE COMMANDE
alter table COMMANDE add
constraint fk_cl_cm foreign key(NumCli) references CLIENT(NumCli);
--- AJOUT DE LA  CONTRAINTE DES FOREIGN KEY A LA TABLE LIGNE_COMMANDE
alter table LIGNE_COMMANDE add
constraint fk_cm_ligc foreign key(NumCom) references COMMANDE(NumCom);
alter table LIGNE_COMMANDE add
constraint fk_prd_ligc foreign key(CodeProd) references PRODUIT(CodeProd);
---- AFFICHAGE DE LA LISTE DES PRODUITS
SELECT * from PRODUIT;
---- AFFICHAGE DE LA LISTE DES CLIENTS PAR NUMERO DE TELEPHONE
select * from CLIENT ORDER BY CLIENT.tel;
------ AFFICHAGE DE LA LISTE DES CLIENTS AYANT COMMANDE CLEARMAN
select DISTINCT CLIENT.NomCli AS NOMS, CLIENT.PrenomCli AS PRENOM, CLIENT.tel AS TELEPHONE from CLIENT, COMMANDE, LIGNE_COMMANDE, PRODUIT
where CLIENT.Numcli=COMMANDE.NumCli AND COMMANDE.NumCom=LIGNE_COMMANDE.NumCom AND LIGNE_COMMANDE.CodeProd=PRODUIT.CodeProd AND NomProd='CLEARMAN';

-- LE CLIENT LE PLUS INTERESSANT
SELECT CLIENT.NomCli from LIGNE_COMMANDE, PRODUIT,COMMANDE, CLIENT
where LIGNE_COMMANDE.CodeProd=PRODUIT.CodeProd and COMMANDE.NumCom=LIGNE_COMMANDE.NumCom and CLIENT.Numcli=COMMANDE.NumCli
group by CLIENT.NomCli
having SUM(LIGNE_COMMANDE.Quantite*PRODUIT.PuProd)>=all (
SELECT SUM(LIGNE_COMMANDE.Quantite*PRODUIT.PuProd) from LIGNE_COMMANDE, PRODUIT,COMMANDE, CLIENT
where LIGNE_COMMANDE.CodeProd=PRODUIT.CodeProd and COMMANDE.NumCom=LIGNE_COMMANDE.NumCom and CLIENT.Numcli=COMMANDE.NumCli
group by CLIENT.NomCli
);

-- LE CLIENT LE MOINS INTERESSANT
SELECT CLIENT.NomCli from LIGNE_COMMANDE, PRODUIT,COMMANDE, CLIENT
where LIGNE_COMMANDE.CodeProd=PRODUIT.CodeProd and COMMANDE.NumCom=LIGNE_COMMANDE.NumCom and CLIENT.Numcli=COMMANDE.NumCli
group by CLIENT.NomCli
having SUM(LIGNE_COMMANDE.Quantite*PRODUIT.PuProd)<=all (
SELECT SUM(LIGNE_COMMANDE.Quantite*PRODUIT.PuProd) from LIGNE_COMMANDE, PRODUIT,COMMANDE, CLIENT
where LIGNE_COMMANDE.CodeProd=PRODUIT.CodeProd and COMMANDE.NumCom=LIGNE_COMMANDE.NumCom and CLIENT.Numcli=COMMANDE.NumCli
group by CLIENT.NomCli
);
--- le nombre de client ayant commande ciprox
SELECT COUNT(*) from LIGNE_COMMANDE, PRODUIT
where LIGNE_COMMANDE.CodeProd=PRODUIT.CodeProd and NomProd='ciprox';

--- TROUVONS LA QUANTITE TOTAL COMMANDE DU PRODUIT CIPROX DE TOUS LES CLIENTS
SELECT SUM(LIGNE_COMMANDE.Quantite) from LIGNE_COMMANDE, PRODUIT,COMMANDE, CLIENT
where LIGNE_COMMANDE.CodeProd=PRODUIT.CodeProd and LIGNE_COMMANDE.NumCom=COMMANDE.NumCom and CLIENT.Numcli=COMMANDE.NumCli AND PRODUIT.NomProd='CIPROX'

---- TOTAL DES PRODUITS COSMETIQUES
SELECT COUNT(*) from PRODUIT
where PRODUIT.Categorie='Cosmetique'
---- TOTAL DES PRODUITS P
SELECT COUNT(*) from PRODUIT
where PRODUIT.Categorie='Pharmaceutique'

