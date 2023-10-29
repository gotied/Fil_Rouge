-- Insertion des données dans la table "fournisseur"
INSERT INTO fournisseur (nm_four, ad_four, tl_four, eml_four) VALUES
('Fournisseur A', '123 Rue des Fournisseurs, Ville A', '555-1234', 'fournisseurA@email.com'),
('Fournisseur B', '456 Avenue des Fournisseurs, Ville B', '555-5678', 'fournisseurB@email.com');

-- Insertion des données dans la table "utilisateur" 
INSERT INTO utilisateur (eml_uti, pwd_uti, nm_uti, pm_uti, tl_uti, rl_uti) VALUES
('client1@email.com', 'motdepasse1', 'Client', 'Un', '555-1111', 1),
('client2@email.com', 'motdepasse2', 'Client', 'Deux', '555-2222', 1),
('client3@email.com', 'motdepasse3', 'Client', 'Trois', '555-3333', 1);

-- Insertion des données dans la table "adresse" 
INSERT INTO adresse (livr_ad, fac_ad, id_uti) VALUES
('123 Rue Livraison 1, Ville X', '456 Rue Facturation 1, Ville X', 1),
('789 Rue Livraison 2, Ville Y', '101 Avenue Facturation 2, Ville Y', 2),
('222 Boulevard Livraison 3, Ville Z', '333 Boulevard Facturation 3, Ville Z', 3);

-- Insertion des données dans la table "commande"
INSERT INTO commande (dt_co, tt_co, et_co, id_uti) VALUES
('2023-10-01 08:00:00', 40.97, 1, 1),
('2023-10-02 14:30:00', 44.97, 1, 1),
('2023-10-03 10:15:00', 12.99, 1, 2),
('2023-10-04 16:45:00', 12.99, 1, 3);

-- Insertion des données dans la table "facture"
INSERT INTO facture (fac, bn_livr, id_co) VALUES
('Facture 1', 'Livraison 1', 1),
('Facture 2', 'Livraison 2', 2),
('Facture 3', 'Livraison 3', 3),
('Facture 4', 'Livraison 4', 4);

-- Insertion des données dans la table "fourni" 
INSERT INTO fourni (id_fil, id_four, pr_four, qte) VALUES
(1, 1, 8.99, 100),
(2, 2, 10.99, 80);

-- Insertion des données dans la table "details" 
INSERT INTO details (id_fil, id_co, qte) VALUES
(1, 1, 2),
(2, 1, 1),
(2, 2, 3),
(1, 3, 1),
(1, 4, 1);
