-- Insertion des genres
INSERT INTO genre (nm_gen) VALUES 
('Action'), -- 1
('Comédie'), -- 2
('Drame'), -- 3
('Sci-Fi'), -- 4
('Thriller'), -- 5
('Aventure'), -- 6
('Animation'), -- 7
('Fantastique'), -- 8
('Guerre'), -- 9
('Policier'); -- 10

-- Insertion des personnes
INSERT INTO personne (pm_per, nm_per) VALUES
('Hayao', 'Miyazaki'), -- 1
('Toshio', 'Suzuki'), -- 2
('Yōji', 'Matsuda'), -- 3
('Yuriko', 'Ishida'), -- 4
('Akihiro', 'Miwa'), -- 5
('Yūko', 'Tanaka'), -- 6
('Tsunehiko', 'Kamijō'), -- 7
('Kaoru', 'Kobayashi'), -- 8
('Sumi', 'Shimamoto'), -- 9
('Hisaya', 'Morishige'), -- 10
('Masahiko', 'Nishimura'), -- 11
('Mitsuko', 'Mori'), -- 12
('Rumi', 'Hiiragi'), -- 13
('Miyu', 'Irino'), -- 14
('Mari', 'Natsuki'), -- 15
('Bunta', 'Sugawara'), -- 16
('Yasuko', 'Sawaguchi'), -- 17
('Takashi', 'Naitō'), -- 18
('Yumi', 'Tamai'), -- 19
('Ryūnosuke', 'Kamiki'), -- 20
('Chieko', 'Baishō'), -- 21
('Takuya', 'Kimura'), -- 22
('Tatsuya', 'Gashuin'), -- 23
('Yō', 'Ōizumi'), -- 24
('Daijirō', 'Harada'), -- 25
('Haruko', 'Katō'), -- 26
('Yayoi', 'Kazuki'), -- 27
('Isao', 'Takahata'), -- 28
('Tōru', 'Hara'), -- 29
('Yoshiko', 'Shinohara'), -- 30
('Ayano', 'Shiraishi'), -- 31
('Tsutomu', 'Tatsumi'), -- 32
('Akemi', 'Yamaguchi'), -- 33
('David', 'Fincher'), -- 34
('Andrew Kevin', 'Walker'), -- 35
('Phyllis', 'Carlyle'), -- 36
('Brad', 'Pitt'), -- 37
('Morgan', 'Freeman'), -- 38
('Gwyneth', 'Paltrow'), -- 39
('Kevin', 'Spacey'), -- 40
('Jim', 'Uhls'), -- 41
('Ross Grayson', 'Bell'), -- 42
('Edward', 'Norton'), -- 43
('Helena', 'Bonham Carter'), -- 44
('Darren', 'Aronofsky'), -- 45
('Hubert', 'Selby Jr.'), -- 46
('Eric', 'Watson'), -- 47
('Jared', 'Leto'), -- 48
('Jennifer', 'Connelly'), -- 49
('Marlon', 'Wayans'), -- 50
('Ellen', 'Burstyn'), -- 51
('Martin', 'Scorsese'), -- 52
('Laeta', 'Kalogridis'), -- 53
('Mike', 'Medavoy'), -- 54
('Leonardo', 'DiCaprio'), -- 55
('Mark', 'Ruffalo'), -- 56
('Ben', 'Kingsley'); -- 57

-- Insertion des rôles
INSERT INTO role (nm_ro) VALUES 
('Acteur'), -- 1
('Réalisateur'), -- 2
('Scénariste'), -- 3
('Producteur'), -- 4
('Doubleur'); -- 5

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
('Princesse Mononoké', "Japon, XVe siècle. Jadis protégée par des animaux géants, la forêt se dépeuple à cause de l'homme. Blessé par un sanglier rendu fou par les démons, le jeune guerrier Ashitaka quitte les siens et part à la recherche du dieu-cerf qui seul pourra défaire le sortilège qui lui gangrène le bras. Au cours de son voyage, Ashitaka rencontre Lady Eboshi, à la tête d’une communauté de forgerons, qui doit se défendre contre ceux qui lui reprochent de détruire la forêt pour alimenter ses forges. Parmi ses pires ennemis se trouve San, une jeune fille sauvage élevée par des loups, aussi appelée Princesse Mononoké, la princesse des spectres...", '1997-07-12', '2h23', 'princesse_mononoke.webp', 12.99, 8.99, 200, true),
('Le voyage de Chihiro', "Chihiro, une fillette de 10 ans, est en route vers sa nouvelle demeure en compagnie de ses parents. Au cours du voyage, la famille fait une halte dans un parc à thème qui leur paraît délabré. Lors de la visite, les parents s’arrêtent dans un des bâtiments pour déguster quelques mets très appétissants, apparus comme par enchantement. Hélas cette nourriture les transforme en porcs. Prise de panique, Chihiro s’enfuit et se retrouve seule dans cet univers fantasmagorique ; elle rencontre alors l’énigmatique Haku, son seul allié dans cette terrible épreuve...", '2001-07-20', '2h05', 'chihiro.webp', 13.99, 9.99, 300, true),
('Le Château ambulant', "La jeune Sophie, 18 ans, travaille inlassablement dans la chapellerie autrefois tenue par son père, malheureusement décédé. Résignée à son sort, c’est lors de l’une de ses rares sorties en ville qu’elle fait la connaissance du beau Hauru, un magicien. Mais la sorcière des Landes, jalouse de cette rencontre, jette un sort à Sophie, la transformant en vieille dame. Accablée par sa nouvelle apparence, Sophie s’enfuit dans les montagnes et tombe sur la demeure de Hauru : son Château Ambulant. Et si tout ceci n’était que le commencement d’une merveilleuse histoire ?", '2004-11-20', '1h59', 'le_chateau_ambulant.webp', 11.99, 6.99, 200, true),
('Le Tombeau des lucioles', "Japon, été 1945. Après le bombardement de Kobé, Seita, un adolescent de quatorze ans et sa petite soeur de quatre ans, Setsuko, orphelins, vont s'installer chez leur tante à quelques dizaines de kilomètres de chez eux. Celle-ci leur fait comprendre qu'ils sont une gêne pour la famille et doivent mériter leur riz quotidien. Seita décide de partir avec sa petite soeur. Ils se réfugient dans un bunker désaffecté en pleine campagne et vivent des jours heureux illuminés par la présence de milliers de lucioles. Mais bientôt la nourriture commence cruellement à manquer.", '1988-04-16', '1h30', 'le_tombeau_des_lucioles.webp', 11.99, 6.99, 200, true),
('Seven', "Pour conclure sa carrière, l'inspecteur Somerset, vieux flic blasé, tombe à sept jours de la retraite sur un criminel peu ordinaire. John Doe, c'est ainsi que se fait appeler l'assassin, a decidé de nettoyer la societé des maux qui la rongent en commettant sept meurtres basés sur les sept pechés capitaux: la gourmandise, l'avarice, la paresse, l'orgueil, la luxure, l'envie et la colère.", '1995-07-22', '2h10', 'seven.webp', 9.99, 5.99, 200, true),
('Fight Club', "Le narrateur, sans identité précise, vit seul, travaille seul, dort seul, mange seul ses plateaux-repas pour une personne comme beaucoup d'autres personnes seules qui connaissent la misère humaine, morale et sexuelle. C'est pourquoi il va devenir membre du Fight club, un lieu clandestin ou il va pouvoir retrouver sa virilité, l'échange et la communication. Ce club est dirigé par Tyler Durden, une sorte d'anarchiste entre gourou et philosophe qui prêche l'amour de son prochain.", '1999-10-15', '2h19', 'fight_club.webp', 9.99, 4.99, 250, true),
('Requiem for a Dream', "Harry Goldfarb est un junkie. Il passe ses journées en compagnie de sa petite amie Marion et son copain Tyrone. Ensemble, ils s'inventent un paradis artificiel. En quête d'une vie meilleure, le trio est entraîné dans une spirale infernale qui les enfonce toujours un peu plus dans l'angoisse et le désespoir. La mère d'Harry, Sara, souffre d'une autre forme d'addiction, la télévision. Juive, fantasque et veuve depuis des années, elle vit seule à Coney Island et nourrit dans le secret l'espoir de participer un jour à son émission préférée. Afin de satisfaire aux canons esthétiques de la télévision, elle s'astreint à un régime draconien. Un jour, elle le sait, elle passera de l'autre côté de l'écran.", '2000-10-27', '1h42', 'requiem_for_a_dream.webp', 14.99, 9.99, 150, true),
('Shutter Island', "En 1954, le marshal Teddy Daniels et son coéquipier Chuck Aule sont envoyés enquêter sur l'île de Shutter Island, dans un hôpital psychiatrique où sont internés de dangereux criminels. L'une des patientes, Rachel Solando, a inexplicablement disparu. Comment la meurtrière a-t-elle pu sortir d'une cellule fermée de l'extérieur ? Le seul indice retrouvé dans la pièce est une feuille de papier sur laquelle on peut lire une suite de chiffres et de lettres sans signification apparente. Oeuvre cohérente d'une malade, ou cryptogramme ?", '2010-02-19', '2h17', 'shutter_island.webp', 9.99, 4.99, 250, true);

-- Attribution des genres aux films
INSERT INTO r_genre_film (id_fil, id_gen) VALUES
(1, 7),
(1, 6),
(1, 3),
(1, 8),
(2, 7),
(2, 6),
(2, 8),
(3, 7),
(3, 6),
(3, 8),
(4, 7),
(4, 3),
(4, 9),
(5, 10),
(5, 5),
(5, 3),
(6, 5),
(6, 3),
(7, 3),
(8, 5),
(8, 3);

-- Attribution des personnes aux films avec leurs rôles
INSERT INTO r_film_perso (id_fil, id_per) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(2, 1),
(2, 2),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(3, 1),
(3, 2), 
(3, 21),
(3, 22),
(3, 5),
(3, 23),
(3, 20),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(4, 28),
(4, 29),
(4, 30),
(4, 31),
(4, 32),
(4, 33),
(5, 34),
(5, 35),
(5, 36),
(5, 37),
(5, 38),
(5, 39),
(5, 40),
(6, 34),
(6, 41),
(6, 42),
(6, 37),
(6, 43),
(6, 44),
(7, 45),
(7, 46),
(7, 47),
(7, 48),
(7, 49),
(7, 50),
(7, 51),
(8, 52),
(8, 53),
(8, 54),
(8, 55),
(8, 56),
(8, 57);

INSERT INTO r_role_perso (id_per, id_ro, id_fil) VALUES
(1, 2, 1),
(1, 3, 1),
(2, 4, 1),
(3, 5, 1),
(4, 5, 1),
(5, 5, 1),
(6, 5, 1),
(7, 5, 1),
(8, 5, 1),
(9, 5, 1),
(10, 5, 1),
(11, 5, 1),
(12, 5, 1),
(1, 2, 2),
(1, 3, 2),
(2, 4, 2),
(13, 5, 2),
(14, 5, 2),
(15, 5, 2),
(16, 5, 2),
(17, 5, 2),
(18, 5, 2),
(19, 5, 2),
(20, 5, 2),
(1, 2, 3),
(1, 3, 3),
(1, 4, 3),
(2, 4, 3),
(21, 5, 3),
(22, 5, 3),
(5, 5, 3),
(23, 5, 3),
(20, 5, 3),
(24, 5, 3),
(25, 5, 3),
(26, 5, 3),
(27, 5, 3),
(28, 2, 4),
(28, 3, 4),
(29, 4, 4),
(30, 5, 4),
(31, 5, 4),
(32, 5, 4),
(33, 5, 4),
(34, 2, 5),
(35, 3, 5),
(36, 4, 5),
(37, 1, 5),
(38, 1, 5),
(39, 1, 5),
(40, 1, 5),
(34, 2, 6),
(41, 3, 6),
(42, 4, 6),
(37, 1, 6),
(43, 1, 6),
(44, 1, 6),
(45, 2, 7),
(45, 3, 7),
(46, 3, 7),
(47, 4, 7),
(48, 1, 7),
(49, 1, 7),
(50, 1, 7),
(51, 1, 7),
(52, 2, 8),
(52, 4, 8),
(53, 3, 8),
(54, 4, 8),
(55, 1, 8),
(56, 1, 8),
(57, 1, 8);

-- Insertion des commandes
INSERT INTO commande (dt_co, tt_co, et_co, id_uti) VALUES
('2022-03-01 12:00:00', 25.98, 1, 1),
('2022-04-02 15:30:00', 27.98, 2, 2),
('2022-05-03 18:45:00', 66.95, 1, 1),
('2022-06-01 14:00:00', 23.98, 1, 4),
('2022-07-02 16:45:00', 23.98, 2, 5);

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
('INV002', 'CreditCard', '2022-04-02', 2),
('INV003', 'CreditCard', '2022-05-03', 3),
('INV004', 'CreditCard', '2022-06-01', 4),
('INV005', 'CreditCard', '2022-07-02', 5);

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