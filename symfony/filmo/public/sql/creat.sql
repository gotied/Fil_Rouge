CREATE DATABASE filmo2;

USE filmo2;

CREATE TABLE produit(
   id_pro INT AUTO_INCREMENT,
   titre VARCHAR(100) ,
   synopsis TEXT,
   date_sortie DATE,
   duree VARCHAR(10) ,
   image VARCHAR(50) ,
   prix_ht DECIMAL(6,2)  ,
   prix_four DECIMAL(6,2)  ,
   stock INT,
   actif BOOLEAN,
   PRIMARY KEY(id_pro)
);

CREATE TABLE personne(
   id_per INT AUTO_INCREMENT,
   prenom VARCHAR(50) ,
   nom VARCHAR(50) ,
   PRIMARY KEY(id_per)
);

CREATE TABLE role(
   id_ro INT AUTO_INCREMENT,
   nom VARCHAR(30) ,
   PRIMARY KEY(id_ro)
);

CREATE TABLE genre(
   id_gen INT AUTO_INCREMENT,
   nom VARCHAR(50) ,
   PRIMARY KEY(id_gen)
);

CREATE TABLE utilisateur(
   id_uti INT AUTO_INCREMENT,
   email VARCHAR(50)  NOT NULL,
   password VARCHAR(250)  NOT NULL,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   telephone VARCHAR(10)  NOT NULL,
   role INT,
   coefficient DECIMAL(6,2)  ,
   responsable_id INT,
   PRIMARY KEY(id_uti),
   FOREIGN KEY(responsable_id) REFERENCES utilisateur(id_uti)
);

CREATE TABLE commande(
   id_co INT AUTO_INCREMENT,
   date_commande DATETIME NOT NULL,
   total DECIMAL(6,2)   NOT NULL,
   etat INT NOT NULL,
   id_uti INT NOT NULL,
   PRIMARY KEY(id_co),
   FOREIGN KEY(id_uti) REFERENCES utilisateur(id_uti)
);

CREATE TABLE adresse(
   id_ad INT AUTO_INCREMENT,
   livraison VARCHAR(200)  NOT NULL,
   facturation VARCHAR(200) ,
   id_uti INT NOT NULL,
   PRIMARY KEY(id_ad),
   FOREIGN KEY(id_uti) REFERENCES utilisateur(id_uti)
);

CREATE TABLE facture(
   id_fac INT AUTO_INCREMENT,
   mode_de_paiement VARCHAR(50) ,
   date_facture DATE,
   date_paiement DATE,
   payer BOOLEAN,
   date_limite DATE,
   id_co INT,
   PRIMARY KEY(id_fac),
   UNIQUE(id_co),
   FOREIGN KEY(id_co) REFERENCES commande(id_co)
);

CREATE TABLE fournisseur(
   id_four INT AUTO_INCREMENT,
   nom VARCHAR(50)  NOT NULL,
   adresse VARCHAR(200)  NOT NULL,
   telephone VARCHAR(10)  NOT NULL,
   email VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_four)
);

CREATE TABLE livraison(
   id_livr INT AUTO_INCREMENT,
   date_livraison DATE NOT NULL,
   id_co INT,
   PRIMARY KEY(id_livr),
   UNIQUE(id_co),
   FOREIGN KEY(id_co) REFERENCES commande(id_co)
);

CREATE TABLE r_film_perso(
   id_pro INT,
   id_per INT,
   PRIMARY KEY(id_pro, id_per),
   FOREIGN KEY(id_pro) REFERENCES produit(id_pro),
   FOREIGN KEY(id_per) REFERENCES personne(id_per)
);

CREATE TABLE r_role_perso(
   id_pro INT,
   id_per INT,
   id_ro INT,
   PRIMARY KEY(id_pro, id_per, id_ro),
   FOREIGN KEY(id_pro) REFERENCES produit(id_pro),
   FOREIGN KEY(id_per) REFERENCES personne(id_per),
   FOREIGN KEY(id_ro) REFERENCES role(id_ro)
);

CREATE TABLE r_genre_film(
   id_pro INT,
   id_gen INT,
   PRIMARY KEY(id_pro, id_gen),
   FOREIGN KEY(id_pro) REFERENCES produit(id_pro),
   FOREIGN KEY(id_gen) REFERENCES genre(id_gen)
);

CREATE TABLE r_fourni_film(
   id_pro INT,
   id_four INT,
   PRIMARY KEY(id_pro, id_four),
   FOREIGN KEY(id_pro) REFERENCES produit(id_pro),
   FOREIGN KEY(id_four) REFERENCES fournisseur(id_four)
);

CREATE TABLE details_commande(
   id_pro INT,
   id_co INT,
   quantite INT NOT NULL,
   PRIMARY KEY(id_pro, id_co),
   FOREIGN KEY(id_pro) REFERENCES produit(id_pro),
   FOREIGN KEY(id_co) REFERENCES commande(id_co)
);