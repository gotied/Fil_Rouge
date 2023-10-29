-- Insertion des données dans la table "genre"
INSERT INTO genre (nm_gen) VALUES
('Action'),
('Aventure'),
('Science-fiction'),
('Comédie');

-- Insertion des données dans la table "personne" 
INSERT INTO personne (nm_per, pm_per, id_fil) VALUES
('Smith', 'John', 1),
('Roberts', 'Emily', 1),
('Johnson', 'Michael', 1),
('Anderson', 'Jessica', 2),
('Davis', 'David', 2),
('Garcia', 'Sofia', 1),
('Lee', 'Daniel', 2),
('White', 'Olivia', 1);

-- Insertion des données dans la table "role" 
INSERT INTO role (nm_ro, id_per) VALUES
('Acteur', 1),
('Acteur', 2),
('Acteur', 3),
('Réalisateur', 4),
('Réalisateur', 5),
('Acteur', 6),
('Acteur', 7),
('Acteur', 8);

-- Insertion des données dans la table "film"
INSERT INTO film (nm_fil, res_fil, sor_fil, dur_fil, img_fil, pr_fil, sto_fil, act_fil, id_gen) VALUES
('Mission Impossible', 'Un agent secret tente de sauver le monde.', '2023-04-15', '2h 20min', 'mission_impossible.jpg', 12.99, 100, 1, 1),
('Le Trésor Perdu', 'Une aventure à la recherche d''un trésor caché.', '2023-06-28', '2h 10min', 'tresor_perdu.jpg', 14.99, 80, 1, 2);

