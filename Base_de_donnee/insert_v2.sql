-- Insertion des genres
INSERT INTO genre (nm_gen) VALUES ('Action'), ('Comedy'), ('Drama'), ('Sci-Fi'), ('Thriller');

-- Insertion des personnes
INSERT INTO personne (nm_per, pm_per) VALUES
('Doe', 'John'),
('Doe', 'Jane'),
('Smith', 'Bob'),
('Johnson', 'Alice'),
('Brown', 'Chris'),
('White', 'Emma'),
('Harrison', 'Aria'),
('Williams', 'Xander'),
('Cruz', 'Luna'),
('Bennett', 'Orion'),
('Reyes', 'Zara'),
('Knight', 'Nova');

-- Insertion des rôles
INSERT INTO role (nm_ro) VALUES ('Actor'), ('Director');

-- Insertion des fournisseurs
INSERT INTO fournisseur (nm_four, ad_four, tl_four, eml_four) VALUES
('MovieSupplier1', '123 Main St, City', '1234567890', 'supplier1@example.com'),
('MovieSupplier2', '456 Oak St, Town', '9876543210', 'supplier2@example.com');

-- Insertion des utilisateurs
INSERT INTO utilisateur (eml_uti, pwd_uti, nm_uti, pm_uti, tl_uti, rl_uti, coef_uti, id_uti_1) VALUES
('user1@example.com', 'password', 'User_name1', 'First_name1', '123456789', 0, 1.2, NULL),
('user2@example.com', 'password', 'User_name2', 'First_name2', '987654321', 0, 1.2, NULL),
('commercial@example.com', 'password', 'Commercial_name', 'First_name', '111222333', 2, NULL, NULL),
('user3@example.com', 'password', 'User_name3', 'First_name3', '555666777', 0, 1.2, NULL),
('user4@example.com', 'password', 'User_name4', 'First_name4', '888999000', 0, 1.2, NULL);

-- Attribution des utilisateurs gérés
UPDATE utilisateur SET id_uti_1 = 3 WHERE id_uti IN (1, 2, 4, 5);

-- Insertion des films
INSERT INTO film (nm_fil, res_fil, sor_fil, dur_fil, img_fil, pr_fil, pr_four, sto_fil, act_fil) VALUES
('Film1', 'Description for Film1', '2022-01-01', '2h30m', 'film1.jpg', 9.99, 8.50, 100, true),
('Film2', 'Description for Film2', '2022-02-15', '2h00m', 'film2.jpg', 7.99, 6.50, 150, true),
('Film3', 'Description for Film3', '2022-04-01', '2h15m', 'film3.jpg', 12.99, 10.50, 120, true),
('Film4', 'Description for Film4', '2022-05-15', '1h45m', 'film4.jpg', 8.99, 7.00, 180, true);

-- Attribution des genres aux films
INSERT INTO r_genre_film (id_fil, id_gen) VALUES
(1, 1), 
(1, 2), 
(1, 3), 
(2, 2), 
(2, 4), 
(2, 5), 
(3, 1), 
(3, 2), 
(4, 2), 
(4, 3);

-- Attribution des personnes aux films avec leurs rôles
INSERT INTO r_film_perso (id_fil, id_per) VALUES
(1, 1), 
(1, 2), 
(1, 4), 
(2, 2), 
(2, 3), 
(2, 5), 
(2, 6), 
(3, 3), 
(3, 4), 
(3, 5), 
(3, 6), 
(3, 7), 
(4, 7), 
(4, 8), 
(4, 9), 
(4, 10), 
(4, 11), 
(4, 12);

INSERT INTO r_role_perso (id_per, id_ro, id_fil) VALUES
(1, 1, 1), 
(2, 1, 1),
(2, 1, 2),
(2, 2, 2),
(3, 1, 2),
(3, 1, 3), 
(4, 1, 1),
(4, 1, 3),
(5, 1, 2),
(5, 1, 3),
(6, 1, 2),
(6, 1, 3), 
(7, 2, 3),
(7, 2, 4),
(8, 1, 4), 
(9, 1, 4), 
(10, 2, 4), 
(11, 1, 4), 
(12, 1, 4);

-- Insertion des commandes
INSERT INTO commande (dt_co, tt_co, et_co, id_uti) VALUES
('2022-03-01 12:00:00', 19.98, 1, 1),
('2022-04-02 15:30:00', 15.98, 2, 2),
('2022-05-03 18:45:00', 29.97, 1, 1),
('2022-06-01 14:00:00', 25.98, 1, 4),
('2022-07-02 16:45:00', 21.98, 2, 5);

-- Insertion des adresses
INSERT INTO adresse (livr_ad, fac_ad, id_uti) VALUES
('123 Shipping St, City', '456 Billing St, City', 1),
('789 Delivery St, Town', '101 Invoicing St, Town', 2),
('42 Starlight Lane, Celestia City', NULL, 3),
('101 Galaxy View, Nebula Town', '456 Comet Boulevard, Nebula Town', 4),
('12 Enchanted Avenue, Fairytale City', '345 Magic Street, Fairytale City', 5);

-- Insertion des factures
INSERT INTO facture (fac, mdp_fac, dt_fac, id_co) VALUES
('INV001', 'CreditCard', '2022-03-01', 1),
('INV002', 'CreditCard', '2022-03-02', 2),
('INV003', 'CreditCard', '2022-03-03', 3),
('INV004', 'CreditCard', '2022-06-01', 4),
('INV005', 'CreditCard', '2022-06-02', 5);

-- Insertion des fournisseurs pour les films
INSERT INTO r_fourni_film (id_fil, id_four) VALUES
(1, 1), 
(2, 1), 
(3, 2), 
(4, 2);

-- Insertion des livraisons
INSERT INTO livraison (bn_livr, dt_lirv, id_co) VALUES
('Delivery1', '2022-03-04', 1),
('Delivery2', '2022-03-05', 2),
('Delivery3', '2022-03-06', 3),
('Delivery4', '2022-06-04', 4),
('Delivery5', '2022-06-05', 5);

-- Insertion des détails des commandes
INSERT INTO details (id_fil, id_co, qte) VALUES
(1, 1, 2), 
(2, 2, 2), 
(1, 3, 3), 
(2, 3, 2), 
(3, 4, 2), 
(4, 5, 1), 
(3, 5, 1);