-- Insertion des genres
INSERT INTO genre (nm_gen) VALUES ('Action'), ('Comedy'), ('Drama'), ('Sci-Fi'), ('Thriller');

-- Insertion des personnes
INSERT INTO personne (nm_per, pm_per) VALUES
('Doe', 'John'),
('Doe', 'Jane'),
('Smith', 'Bob'),
('Johnson', 'Alice'),
('Brown', 'Chris'),
('White', 'Emma');

-- Insertion des rôles
INSERT INTO role (nm_ro) VALUES ('Actor'), ('Director');

-- Insertion des fournisseurs
INSERT INTO fournisseur (nm_four, ad_four, tl_four, eml_four) VALUES
('MovieSupplier1', '123 Main St, City', '1234567890', 'supplier1@example.com'),
('MovieSupplier2', '456 Oak St, Town', '9876543210', 'supplier2@example.com');

-- Insertion des utilisateurs
INSERT INTO utilisateur (eml_uti, pwd_uti, nm_uti, pm_uti, tl_uti, rl_uti, coef_uti, id_uti_1) VALUES
('user1@example.com', 'password1', 'User1', 'Last1', '123456789', 2, 1.5, NULL),
('user2@example.com', 'password2', 'User2', 'Last2', '987654321', 2, 1.2, NULL),
('admin@example.com', 'adminpassword', 'Admin', 'AdminLast', '111222333', 1, 1.0, NULL);

-- Attribution des utilisateurs gérés
UPDATE utilisateur SET id_uti_1 = 3 WHERE id_uti IN (1, 2);

-- Insertion des films
INSERT INTO film (nm_fil, res_fil, sor_fil, dur_fil, img_fil, pr_fil, pr_four, sto_fil, act_fil) VALUES
('Film1', 'Description for Film1', '2022-01-01', '2h30m', 'film1.jpg', 9.99, 8.50, 100, true),
('Film2', 'Description for Film2', '2022-02-15', '2h00m', 'film2.jpg', 7.99, 6.50, 150, true);

-- Attribution des genres aux films
INSERT INTO appartient (id_fil, id_gen) VALUES
(1, 1), (1, 2), (1, 3), (2, 2), (2, 4), (2, 5);

-- Attribution des personnes aux films avec leurs rôles
INSERT INTO joue (id_fil, id_per) VALUES
(1, 1), (1, 2), (1, 4), (2, 2), (2, 3), (2, 5), (2, 6);

INSERT INTO a_un (id_per, id_ro) VALUES
(1, 1), (2, 1), (4, 1), (2, 2), (3, 1), (5, 2), (6, 1);

-- Insertion des commandes
INSERT INTO commande (dt_co, tt_co, et_co, id_uti) VALUES
('2022-03-01 12:00:00', 19.98, 1, 1),
('2022-03-02 15:30:00', 15.98, 2, 2),
('2022-03-03 18:45:00', 29.97, 1, 1);

-- Insertion des adresses
INSERT INTO adresse (livr_ad, fac_ad, id_uti) VALUES
('123 Shipping St, City', '456 Billing St, City', 1),
('789 Delivery St, Town', '101 Invoicing St, Town', 2);

-- Insertion des factures
INSERT INTO facture (fac, mdp_fac, dt_fac, id_co) VALUES
('INV001', 'CreditCard1', '2022-03-01', 1),
('INV002', 'CreditCard2', '2022-03-02', 2),
('INV003', 'CreditCard1', '2022-03-03', 3);

-- Insertion des fournisseurs pour les films
INSERT INTO fourni (id_fil, id_four) VALUES
(1, 1), (1, 2), (2, 1), (2, 2);

-- Insertion des livraisons
INSERT INTO livraison (bn_livr, dt_lirv, id_co) VALUES
('Delivery1', '2022-03-02', 1),
('Delivery2', '2022-03-03', 2),
('Delivery3', '2022-03-04', 3);

-- Insertion des détails des commandes
INSERT INTO details (id_fil, id_co, qte) VALUES
(1, 1, 2), (2, 2, 1), (1, 3, 3), (2, 3, 2);