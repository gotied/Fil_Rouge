CREATE DATABASE filmo;

USE filmo;

CREATE TABLE genre(
   id_gen INT AUTO_INCREMENT,
   nm_gen VARCHAR(50) ,
   PRIMARY KEY(id_gen)
);

CREATE TABLE utilisateur(
   id_uti INT AUTO_INCREMENT,
   eml_uti VARCHAR(50) ,
   pwd_uti VARCHAR(250) ,
   nm_uti VARCHAR(50) ,
   pm_uti VARCHAR(50) ,
   tl_uti VARCHAR(10) ,
   rl_uti INT,
   PRIMARY KEY(id_uti)
);

CREATE TABLE commande(
   id_co INT AUTO_INCREMENT,
   dt_co DATETIME,
   tt_co DECIMAL(8,2)  ,
   et_co INT,
   id_uti INT,
   PRIMARY KEY(id_co),
   FOREIGN KEY(id_uti) REFERENCES utilisateur(id_uti)
);

CREATE TABLE adresse(
   id_ad INT AUTO_INCREMENT,
   livr_ad VARCHAR(200) ,
   fac_ad VARCHAR(200) ,
   id_uti INT,
   PRIMARY KEY(id_ad),
   FOREIGN KEY(id_uti) REFERENCES utilisateur(id_uti)
);

CREATE TABLE facture(
   id_fac INT AUTO_INCREMENT,
   fac VARCHAR(50) ,
   bn_livr VARCHAR(50) ,
   id_co INT,
   PRIMARY KEY(id_fac),
   FOREIGN KEY(id_co) REFERENCES commande(id_co)
);

CREATE TABLE fournisseur(
   id_four INT AUTO_INCREMENT,
   nm_four VARCHAR(50) ,
   ad_four VARCHAR(200) ,
   tl_four VARCHAR(10) ,
   eml_four VARCHAR(50) ,
   PRIMARY KEY(id_four)
);

CREATE TABLE film(
   id_fil INT AUTO_INCREMENT,
   nm_fil VARCHAR(100) ,
   res_fil TEXT,
   sor_fil DATE,
   dur_fil VARCHAR(10) ,
   img_fil VARCHAR(50) ,
   pr_fil DECIMAL(6,2)  ,
   sto_fil INT,
   act_fil BOOLEAN,
   id_gen INT,
   PRIMARY KEY(id_fil),
   FOREIGN KEY(id_gen) REFERENCES genre(id_gen)
);

CREATE TABLE personne(
   id_per INT AUTO_INCREMENT,
   nm_per VARCHAR(50) ,
   pm_per VARCHAR(50) ,
   id_fil INT,
   PRIMARY KEY(id_per),
   FOREIGN KEY(id_fil) REFERENCES film(id_fil)
);

CREATE TABLE role(
   id_ro INT AUTO_INCREMENT,
   nm_ro VARCHAR(30) ,
   id_per INT,
   PRIMARY KEY(id_ro),
   FOREIGN KEY(id_per) REFERENCES personne(id_per)
);

CREATE TABLE fourni(
   id_fil INT,
   id_four INT,
   pr_four DECIMAL(7,2)  ,
   qte INT,
   PRIMARY KEY(id_fil, id_four),
   FOREIGN KEY(id_fil) REFERENCES film(id_fil),
   FOREIGN KEY(id_four) REFERENCES fournisseur(id_four)
);

CREATE TABLE details(
   id_fil INT,
   id_co INT,
   qte INT,
   PRIMARY KEY(id_fil, id_co),
   FOREIGN KEY(id_fil) REFERENCES film(id_fil),
   FOREIGN KEY(id_co) REFERENCES commande(id_co)
);
