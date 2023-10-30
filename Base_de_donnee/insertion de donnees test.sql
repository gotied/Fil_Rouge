
INSERT INTO genre (nm_gen) VALUES
('Action'),
('Aventure'),
('Science-fiction'),
('Comédie');

INSERT INTO film (nm_fil, res_fil, sor_fil, dur_fil, img_fil, pr_fil, sto_fil, act_fil, id_gen) VALUES
('Mission Impossible', 'Un agent secret tente de sauver le monde.', '2023-04-15', '2h 20min', 'mission_impossible.jpg', 12.99, 100, 1, 1),
('Le Trésor Perdu', 'Une aventure à la recherche d''un trésor caché.', '2023-06-28', '2h 10min', 'tresor_perdu.jpg', 14.99, 80, 1, 2);

INSERT INTO personne (nm_per, pm_per, id_fil) VALUES
('Smith', 'John', 1),
('Roberts', 'Emily', 1),
('Johnson', 'Michael', 1),
('Anderson', 'Jessica', 2),
('Davis', 'David', 2),
('Garcia', 'Sofia', 1),
('Lee', 'Daniel', 2),
('White', 'Olivia', 1);

INSERT INTO role (nm_ro, id_per) VALUES
('Acteur', 1),
('Acteur', 2),
('Acteur', 3),
('Réalisateur', 4),
('Réalisateur', 5),
('Acteur', 6),
('Acteur', 7),
('Acteur', 8);

INSERT INTO fournisseur (nm_four, ad_four, tl_four, eml_four) VALUES
('Fournisseur A', '123 Rue des Fournisseurs, Ville A', '555-1234', 'fournisseurA@email.com'),
('Fournisseur B', '456 Avenue des Fournisseurs, Ville B', '555-5678', 'fournisseurB@email.com');

INSERT INTO fourni (id_fil, id_four, pr_four, qte) VALUES
(1, 1, 8.99, 100),
(2, 2, 10.99, 80);

INSERT INTO utilisateur (eml_uti, pwd_uti, nm_uti, pm_uti, tl_uti, rl_uti) VALUES
('client1@email.com', 'motdepasse1', 'Client', 'Un', '555-1111', 1),
('client2@email.com', 'motdepasse2', 'Client', 'Deux', '555-2222', 1),
('client3@email.com', 'motdepasse3', 'Client', 'Trois', '555-3333', 1);

INSERT INTO adresse (livr_ad, fac_ad, id_uti) VALUES
('123 Rue Livraison 1, Ville X', '456 Rue Facturation 1, Ville X', 1),
('789 Rue Livraison 2, Ville Y', '101 Avenue Facturation 2, Ville Y', 2),
('222 Boulevard Livraison 3, Ville Z', '333 Boulevard Facturation 3, Ville Z', 3);

INSERT INTO commande (dt_co, tt_co, et_co, id_uti) VALUES
('2023-10-01 08:00:00', 40.97, 1, 1),
('2023-10-02 14:30:00', 44.97, 1, 1),
('2023-10-03 10:15:00', 12.99, 1, 2),
('2023-10-04 16:45:00', 12.99, 1, 3);

INSERT INTO facture (fac, bn_livr, id_co) VALUES
('Facture 1', 'Livraison 1', 1),
('Facture 2', 'Livraison 2', 2),
('Facture 3', 'Livraison 3', 3),
('Facture 4', 'Livraison 4', 4);

INSERT INTO details (id_fil, id_co, qte) VALUES
(1, 1, 2),
(2, 1, 1),
(2, 2, 3),
(1, 3, 1),
(1, 4, 1);

