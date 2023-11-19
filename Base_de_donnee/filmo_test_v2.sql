CREATE DATABASE filmo;

USE filmo;

CREATE TABLE film(
   id_fil INT AUTO_INCREMENT,
   nm_fil VARCHAR(100) ,
   res_fil TEXT,
   sor_fil DATE,
   dur_fil VARCHAR(10) ,
   img_fil VARCHAR(50) ,
   pr_fil DECIMAL(6,2)  ,
   pr_four DECIMAL(7,2)  ,
   sto_fil INT,
   act_fil BOOLEAN,
   PRIMARY KEY(id_fil)
);

CREATE TABLE personne(
   id_per INT AUTO_INCREMENT,
   pm_per VARCHAR(50) ,
   nm_per VARCHAR(50) ,
   PRIMARY KEY(id_per)
);

CREATE TABLE role(
   id_ro INT AUTO_INCREMENT,
   nm_ro VARCHAR(30) ,
   PRIMARY KEY(id_ro)
);

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
   coef_uti DECIMAL(6,2)  ,
   id_uti_1 INT,
   PRIMARY KEY(id_uti),
   FOREIGN KEY(id_uti_1) REFERENCES utilisateur(id_uti)
);

CREATE TABLE commande(
   id_co INT AUTO_INCREMENT,
   dt_co DATETIME,
   tt_co DECIMAL(8,2)  ,
   et_co INT,
   id_uti INT NOT NULL,
   PRIMARY KEY(id_co),
   FOREIGN KEY(id_uti) REFERENCES utilisateur(id_uti)
);

CREATE TABLE adresse(
   id_ad INT AUTO_INCREMENT,
   livr_ad VARCHAR(200) ,
   fac_ad VARCHAR(200) ,
   id_uti INT NOT NULL,
   PRIMARY KEY(id_ad),
   FOREIGN KEY(id_uti) REFERENCES utilisateur(id_uti)
);

CREATE TABLE facture(
   id_fac INT AUTO_INCREMENT,
   fac VARCHAR(50) ,
   mdp_fac VARCHAR(50) ,
   dt_fac DATE,
   id_co INT,
   PRIMARY KEY(id_fac),
   UNIQUE(id_co),
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

CREATE TABLE livraison(
   id_livr INT AUTO_INCREMENT,
   bn_livr VARCHAR(50) ,
   dt_lirv DATE,
   id_co INT,
   PRIMARY KEY(id_livr),
   UNIQUE(id_co),
   FOREIGN KEY(id_co) REFERENCES commande(id_co)
);

CREATE TABLE r_film_perso(
   id_fil INT,
   id_per INT,
   PRIMARY KEY(id_fil, id_per),
   FOREIGN KEY(id_fil) REFERENCES film(id_fil),
   FOREIGN KEY(id_per) REFERENCES personne(id_per)
);

CREATE TABLE r_role_perso(
   id_fil INT,
   id_per INT,
   id_ro INT,
   PRIMARY KEY(id_fil, id_per, id_ro),
   FOREIGN KEY(id_fil) REFERENCES film(id_fil),
   FOREIGN KEY(id_per) REFERENCES personne(id_per),
   FOREIGN KEY(id_ro) REFERENCES role(id_ro)
);

CREATE TABLE r_genre_film(
   id_fil INT,
   id_gen INT,
   PRIMARY KEY(id_fil, id_gen),
   FOREIGN KEY(id_fil) REFERENCES film(id_fil),
   FOREIGN KEY(id_gen) REFERENCES genre(id_gen)
);

CREATE TABLE r_fourni_film(
   id_fil INT,
   id_four INT,
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
