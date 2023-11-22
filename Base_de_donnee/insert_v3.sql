USE filmo;

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
('Policier'), -- 10
('Western'), -- 11
('Biopic'); -- 12

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
('Ben', 'Kingsley'), -- 57
('Paul', 'Schrader'), -- 58
('Michael', 'Phillips'), -- 59
('Julia', 'Phillips'), -- 60
('Robert', 'De Niro'), -- 61
('Cybill', 'Shepherd'), -- 62
('Peter', 'Boyle'), -- 63
('Jodie', 'Foster'), -- 64
('Katsuhiro', 'Ōtomo'), -- 65
('Izō', 'Hashimoto'), -- 66
('Ryôhei', 'Suzuki'), -- 67
('Mitsuo', 'Iwata'), -- 68
('Nozomu', 'Sasaki'), -- 69
('Mami', 'Koyama'), -- 70
('Tarō', 'Ishida'), -- 71
('Christopher', 'Nolan'), -- 72
('Jonathan', 'Nolan'), -- 73
('Lynda', 'Obst'), -- 74
('Emma', 'Thomas'), -- 75
('Matthew', 'McConaughey'), -- 76
('Anne', 'Hathaway'), -- 77
('Michael', 'Caine'), -- 78
('Jessica', 'Chastain'), -- 79
('Casey', 'Affleck'), -- 80
('Matt', 'Damon'), -- 81
('Charles', 'Roven'), -- 82
('Christian', 'Bale'), -- 83
('Aaron', 'Eckhart'), -- 84
('Heath', 'Ledger'), -- 85
('Gary', 'Oldman'), -- 86
('Maggie', 'Gyllenhaal'), -- 87
('Morgan', 'Freeman'), -- 88
('Cillian', 'Murphy'), -- 89
('Andrew', 'Adamson'), -- 90
('Vicky', 'Jenson'), -- 91
('Ted', 'Elliott'), -- 92
('Jeffrey', 'Katzenberg'), -- 93
('Mike', 'Myers'), -- 94
('Eddie', 'Murphy'), -- 95
('Cameron', 'Diaz'), -- 96
('John', 'Lithgow'), -- 97
('Quentin', 'Tarantino'), -- 98
('Lawrence', 'Bender'), -- 99
('Mélanie', 'Laurent'), -- 100
('Christoph', 'Waltz'), -- 101
('Eli', 'Roth'), -- 102
('Michael', 'Fassbender'), -- 103
('Diane', 'Kruger'), -- 104
('Reginald', 'Hudlin'), -- 105
('Jamie', 'Foxx'), -- 106
('Kerry', 'Washington'), -- 107
('Samuel', 'L. Jackson'), -- 108
('David', 'Heyman'), -- 109
('Shannon', 'McIntosh'), -- 110
('Margot', 'Robbie'), -- 111
('Margaret', 'Qualley'), -- 112
('Al', 'Pacino'), -- 113
('Michael', 'Mann'), -- 114
('Stuart', 'Beattie'), -- 115
('Julie', 'Richardson'), -- 116
('Tom', 'Cruise'), -- 117
('Jada', 'Pinkett Smith'), -- 118
('Ann', 'Biderman'), -- 119
('Ronan', 'Bennett'), -- 120
('G.', 'Mac Brown'), -- 121
('Johnny', 'Depp'), -- 122
('Marion', 'Cotillard'), -- 123
('M.', 'Night Shyamalan'), -- 124
('Frank', 'Marshall'), -- 125
('Sam', 'Mercer'), -- 126
('Mel', 'Gibson'), -- 127
('Joaquin', 'Phoenix'), -- 128
('Rory', 'Culkin'), -- 129
('Abigail', 'Breslin'), -- 130
('Cherry', 'Jones'), -- 131
('Kathleen', 'Kennedy'), -- 132
('Barry', 'Mendel'), -- 133
('Bruce', 'Willis'), -- 134
('Haley', 'Joel Osment'), -- 135
('Olivia', 'Williams'), -- 136
('Toni', 'Collette'); -- 137

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
('Princesse Mononoké', "Japon, XVe siècle. Jadis protégée par des animaux géants, la forêt se dépeuple à cause de l'homme.\nBlessé par un sanglier rendu fou par les démons, le jeune guerrier Ashitaka quitte les siens et part à la recherche du dieu-cerf qui seul pourra défaire le sortilège qui lui gangrène le bras.\nAu cours de son voyage, Ashitaka rencontre Lady Eboshi, à la tête d’une communauté de forgerons, qui doit se défendre contre ceux qui lui reprochent de détruire la forêt pour alimenter ses forges.\nParmi ses pires ennemis se trouve San, une jeune fille sauvage élevée par des loups, aussi appelée Princesse Mononoké, la princesse des spectres...", '1997-07-12', '2h23', 'princesse_mononoke.webp', 12.99, 8.99, 200, true),
('Le voyage de Chihiro', "Chihiro, une fillette de 10 ans, est en route vers sa nouvelle demeure en compagnie de ses parents.\nAu cours du voyage, la famille fait une halte dans un parc à thème qui leur paraît délabré.\nLors de la visite, les parents s’arrêtent dans un des bâtiments pour déguster quelques mets très appétissants, apparus comme par enchantement.\nHélas cette nourriture les transforme en porcs.\nPrise de panique, Chihiro s’enfuit et se retrouve seule dans cet univers fantasmagorique ; elle rencontre alors l’énigmatique Haku, son seul allié dans cette terrible épreuve...", '2001-07-20', '2h05', 'chihiro.webp', 13.99, 9.99, 300, true),
('Le Château ambulant', "La jeune Sophie, 18 ans, travaille inlassablement dans la chapellerie autrefois tenue par son père, malheureusement décédé.\nRésignée à son sort, c’est lors de l’une de ses rares sorties en ville qu’elle fait la connaissance du beau Hauru, un magicien.\nMais la sorcière des Landes, jalouse de cette rencontre, jette un sort à Sophie, la transformant en vieille dame.\nAccablée par sa nouvelle apparence, Sophie s’enfuit dans les montagnes et tombe sur la demeure de Hauru : son Château Ambulant.\nEt si tout ceci n’était que le commencement d’une merveilleuse histoire ?", '2004-11-20', '1h59', 'le_chateau_ambulant.webp', 11.99, 6.99, 200, true),
('Le Tombeau des lucioles', "Japon, été 1945. Après le bombardement de Kobé, Seita, un adolescent de quatorze ans et sa petite soeur de quatre ans, Setsuko, orphelins, vont s'installer chez leur tante à quelques dizaines de kilomètres de chez eux.\nCelle-ci leur fait comprendre qu'ils sont une gêne pour la famille et doivent mériter leur riz quotidien.\nSeita décide de partir avec sa petite soeur. Ils se réfugient dans un bunker désaffecté en pleine campagne et vivent des jours heureux illuminés par la présence de milliers de lucioles.\nMais bientôt la nourriture commence cruellement à manquer.", '1988-04-16', '1h30', 'le_tombeau_des_lucioles.webp', 11.99, 6.99, 200, true),
('Seven', "Pour conclure sa carrière, l'inspecteur Somerset, vieux flic blasé, tombe à sept jours de la retraite sur un criminel peu ordinaire.\nJohn Doe, c'est ainsi que se fait appeler l'assassin, a décidé de nettoyer la société des maux qui la rongent en commettant sept meurtres basés sur les sept péchés capitaux: la gourmandise, l'avarice, la paresse, l'orgueil, la luxure, l'envie et la colère.", '1995-07-22', '2h10', 'seven.webp', 9.99, 5.99, 200, true),
('Fight Club', "Le narrateur, sans identité précise, vit seul, travaille seul, dort seul, mange seul ses plateaux-repas pour une personne comme beaucoup d'autres personnes seules qui connaissent la misère humaine, morale et sexuelle.\nC'est pourquoi il va devenir membre du Fight club, un lieu clandestin où il va pouvoir retrouver sa virilité, l'échange et la communication.\nCe club est dirigé par Tyler Durden, une sorte d'anarchiste entre gourou et philosophe qui prêche l'amour de son prochain.", '1999-10-15', '2h19', 'fight_club.webp', 9.99, 4.99, 250, true),
('Requiem for a Dream', "Harry Goldfarb est un junkie. Il passe ses journées en compagnie de sa petite amie Marion et son copain Tyrone.\nEnsemble, ils s'inventent un paradis artificiel. En quête d'une vie meilleure, le trio est entraîné dans une spirale infernale qui les enfonce toujours un peu plus dans l'angoisse et le désespoir.\nLa mère d'Harry, Sara, souffre d'une autre forme d'addiction, la télévision. Juive, fantasque et veuve depuis des années, elle vit seule à Coney Island et nourrit dans le secret l'espoir de participer un jour à son émission préférée.\nAfin de satisfaire aux canons esthétiques de la télévision, elle s'astreint à un régime draconien. Un jour, elle le sait, elle passera de l'autre côté de l'écran.", '2000-10-27', '1h42', 'requiem_for_a_dream.webp', 14.99, 9.99, 150, true),
('Shutter Island', "En 1954, le marshal Teddy Daniels et son coéquipier Chuck Aule sont envoyés enquêter sur l'île de Shutter Island, dans un hôpital psychiatrique où sont internés de dangereux criminels.\nL'une des patientes, Rachel Solando, a inexplicablement disparu. Comment la meurtrière a-t-elle pu sortir d'une cellule fermée de l'extérieur ? Le seul indice retrouvé dans la pièce est une feuille de papier sur laquelle on peut lire une suite de chiffres et de lettres sans signification apparente.\nOeuvre cohérente d'une malade, ou cryptogramme ?", '2010-02-19', '2h17', 'shutter_island.webp', 9.99, 4.99, 250, true),
('Taxi Driver', "Vétéran de la Guerre du Vietnam, Travis Bickle est chauffeur de taxi dans la ville de New York.\nSes rencontres nocturnes et la violence quotidienne dont il est témoin lui font peu à peu perdre la tête.\nIl se charge bientôt de délivrer une prostituée mineure de ses souteneurs.", '1976-02-08', '1h55', 'taxi_driver.webp', 7.99, 4.99, 250, true),
('Akira', "En juillet 1988, une mystérieuse explosion détruit Tokyo, déclenchant la troisième guerre mondiale.\n31 ans plus tard, en 2019, Néo Tokyo, la mégalopole construite sur la baie de Tokyo a retrouvé sa prospérité d’antan et se prépare à l’évènement majeur des Jeux olympiques de 2020.\nDans l'ombre, les choses sont moins réjouissantes, le chômage augmente et les actions des dissidents se multiplient, les citadins cherchent leur salut dans les cultes religieux et les drogues.\nLes plus jeunes se réunissent en gang rebelles et se défient dans d’interminables courses de motos à travers la mégalopole.\nAu cours d’une de leurs échappées, Kaneda et Tetsuo manquent d’écraser un enfant. Un enfant étrange, au visage de vieillard, appelé n ° 26.\nKaneda et ses amis sont arrêtés par la police alors que n ° 26 et Tetsuo, blessé, sont emmenés par l'armée.\nTetsuo est prisonnier d’un laboratoire et devient l’objet de tests ultrasecrets qui le dotent de pouvoirs surnaturels.\nC’est là qu’il apprend qui est AKIRA, ce garçon a la force incroyable à l’origine de la destruction de Tokyo, il y a 31 ans.", '1988-07-16', '2h04', 'akira.webp', 13.99, 8.99, 250, true),
('Interstellar', "Le film raconte les aventures d’un groupe d’explorateurs qui utilisent une faille récemment découverte dans l’espace-temps afin de repousser les limites humaines et partir à la conquête des distances astronomiques dans un voyage interstellaire.", '2014-10-26', '2h49', 'interstellar.webp', 9.99, 5.99, 200, true),
('The Dark Knight', "Dans ce nouveau volet, Batman augmente les mises dans sa guerre contre le crime.\nAvec l'appui du lieutenant de police Jim Gordon et du procureur de Gotham, Harvey Dent, Batman vise à éradiquer le crime organisé qui pullule dans la ville.\nLeur association est très efficace mais elle sera bientôt bouleversée par le chaos déclenché par un criminel que les citoyens de Gotham connaissent sous le nom de Joker.", '2008-07-18', '2h32', 'the_dark_knight.webp', 13.99, 6.99, 300, true),
('Shrek', "Shrek, un ogre verdâtre, cynique et malicieux, a élu domicile dans un marécage qu'il croit être un havre de paix.\nUn matin, alors qu'il sort faire sa toilette, il découvre de petites créatures agaçantes qui errent dans son marais.\nShrek se rend alors au château du seigneur Lord Farquaad, qui aurait soit-disant expulsé ces êtres de son royaume.\nCe dernier souhaite épouser la princesse Fiona, mais celle-ci est retenue prisonnière par un abominable dragon.\nIl lui faut un chevalier assez brave pour secourir la belle. Shrek accepte d'accomplir cette mission.\nEn échange, le seigneur devra débarrasser son marécage de ces créatures envahissantes.\nOr, la princesse Fiona cache un secret terrifiant qui va entraîner Shrek et son compagnon l'âne dans une palpitante et périlleuse aventure.", '2004-04-22', '1h29', 'shrek.webp', 6.99, 3.99, 300, true),
('Inglourious Basterds', "Dans la France occupée de 1940, Shosanna Dreyfus assiste à l'exécution de sa famille tombée entre les mains du colonel nazi Hans Landa.\nShosanna s'échappe de justesse et s'enfuit à Paris où elle se construit une nouvelle identité en devenant exploitante d'une salle de cinéma.\nQuelque part ailleurs en Europe, le lieutenant Aldo Raine forme un groupe de soldats juifs américains pour mener des actions punitives particulièrement sanglantes contre les nazis.\nLes bâtards, nom sous lequel leurs ennemis vont apprendre à les connaître, se joignent à l'actrice allemande et agent secret Bridget von Hammersmark pour tenter d'éliminer les hauts dignitaires du Troisième Reich.\nLeurs destins vont se jouer à l'entrée du cinéma où Shosanna est décidée à mettre à exécution une vengeance très personnelle...", '2009-08-19', '2h39', 'inglourious_basterds.webp', 8.99, 3.99, 200, true),
('Django Unchained', "Dans le sud des États-Unis, deux ans avant la guerre de Sécession, le Dr King Schultz, un chasseur de primes allemand, fait l’acquisition de Django, un esclave qui peut l’aider à traquer les frères Brittle, les meurtriers qu’il recherche.\nSchultz promet à Django de lui rendre sa liberté lorsqu’il aura capturé les Brittle – morts ou vifs.\nAlors que les deux hommes pistent les dangereux criminels, Django n’oublie pas que son seul but est de retrouver Broomhilda, sa femme, dont il fut séparé à cause du commerce des esclaves…\nLorsque Django et Schultz arrivent dans l’immense plantation du puissant Calvin Candie, ils éveillent les soupçons de Stephen, un esclave qui sert Candie et a toute sa confiance.\nLe moindre de leurs mouvements est désormais épié par une dangereuse organisation de plus en plus proche…\nSi Django et Schultz veulent espérer s’enfuir avec Broomhilda, ils vont devoir choisir entre l’indépendance et la solidarité, entre le sacrifice et la survie…", '2012-12-25', '2h44', 'django_unchained.webp', 7.99, 3.99, 250, true),
('Once Upon a Time… in Hollywood', "En 1969, la star de télévision Rick Dalton et le cascadeur Cliff Booth, sa doublure de longue date, poursuivent leurs carrières au sein d’une industrie qu’ils ne reconnaissent plus.", '2019-07-26', '2h41', 'one_upton_a_time_in_hollywood.webp', 7.99, 3.99, 150, true),
('Collatéral', "Max est taxi de nuit à Los Angeles.\nUn soir, il se lie d'amitié avec une dénommée Annie Farrell, une belle femme procureur montée à l'arrière de son véhicule.\nQuelques minutes plus tard, c'est au tour d'un homme prénommé Vincent de monter dans le taxi. Un businessman, selon toute apparence, avec un emploi du temps chargé : pas moins de cinq rendez-vous à tenir dans la nuit.\nMax accepte de lui louer ses services jusqu'au petit matin, en échange de 600 dollars.\nPremier arrêt. Vincent entre dans un immeuble. Un coup de feu éclate aussitôt, un corps plonge dans le vide, s'écrasant sur le toit du taxi.\nVincent redescend et, sous la menace de son arme, oblige Max à dissimuler le cadavre dans le coffre et à reprendre son mortel périple.\nUn chauffeur de taxi, un tueur implacable, cinq cibles à éliminer, des agents des stups et une équipe du FBI... Leurs destins se joueront cette nuit...", '2004-08-06', '2h00', 'collateral.webp', 5.99, 1.99, 300, true),
('Public Enemies', "Basé sur l'histoire vraie de John Dillinger, un braqueur de banque hors pair qui a sévi à de nombreuses reprises dans l'Amérique des années 30.\nAvancé comme l'ennemi public numéro 1 par le patron du FBI, John Edgar Hoover, Dillinger sera traqué sans relâche par Melvin Purvis, l'un des agents fédéraux des plus efficaces.", '2009-07-1', '2h20', 'public_enemies.webp', 7.99, 3.99, 200, true),
('Signes', "A Bucks County, en Pennsylvanie.\nAprès la perte de sa femme, Graham Hess a rendu sa charge de pasteur.\nTout en s'occupant de sa ferme, il tente d'élever de son mieux ses deux enfants, Morgan et Bo.\nSon jeune frère Merrill, une ancienne gloire du base-ball, est revenu vivre avec lui pour l'aider.\nUn matin, la petite famille découvre l'apparition dans ses champs de gigantesques signes et cercles étranges.\nDes extra-terrestres seraient-ils à l'origine de tels phénomènes surnaturels ?\nGraham et Merrill vont s'efforcer de percer le mystère qui entoure ces dessins.", '2002-08-02', '1h45', 'signes.webp', 7.99, 3.99, 150, true),
('Sixième Sens', "Cole Sear, garçonnet de huit ans, est hanté par un terrible secret.\nSon imaginaire est visité par des esprits menaçants.\nTrop jeune pour comprendre le pourquoi de ces apparitions et traumatisé par ces pouvoirs paranormaux, Cole s'enferme dans une peur maladive et ne veut révéler à personne la cause de son enfermement, à l'exception d'un psychologue pour enfants.\nLa recherche d'une explication rationnelle guidera l'enfant et le thérapeute vers une vérité foudroyante et inexplicable.", '1999-08-02', '1h47', 'sixieme_sens.webp', 6.99, 1.99, 150, true);

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
(8, 3),
(9, 3),
(10, 7),
(10, 4),
(10, 1),
(10, 3),
(11, 4),
(11, 3),
(12, 1),
(12, 5),
(13, 7),
(13, 2),
(13, 6), 
(13, 8),
(14, 9),
(15, 11),
(16, 3),
(16, 2),
(17, 10),
(17, 3),
(17, 5),
(18, 10),
(18, 3),
(18, 12),
(19, 8),
(19, 3),
(19, 4),
(20, 5),
(20, 3);

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
(8, 57),
(9, 52),
(9, 58),
(9, 59),
(9, 60),
(9, 61),
(9, 62),
(9, 63),
(9, 64),
(10, 65),
(10, 66),
(10, 67),
(10, 68),
(10, 69),
(10, 70),
(10, 71),
(11, 72),
(11, 73),
(11, 74),
(11, 75),
(11, 76),
(11, 77),
(11, 78),
(11, 79),
(11, 81),
(12, 72),
(12, 73), 
(12, 75),
(12, 78), 
(12, 82),
(12, 83),
(12, 84),
(12, 85),
(12, 86),
(12, 87),
(12, 88),
(12, 89),
(13, 90),
(13, 91),
(13, 92),
(13, 93),
(13, 94),
(13, 95),
(13, 96),
(13, 97),
(14, 98),
(14, 99), 
(14, 37),
(14, 100),
(14, 101),
(14, 102),
(14, 103),
(14, 104),
(15, 98),
(15, 105),
(15, 55), 
(15, 101), 
(15, 106),
(15, 107),
(15, 108),
(16, 98),
(16, 109),
(16, 110),
(16, 55),
(16, 37),
(16, 111),
(16, 112),
(16, 113),
(17, 114),
(17, 115),
(17, 116),
(17, 117),
(17, 106),
(17, 56),
(17, 118),
(18, 114),
(18, 119),
(18, 120),
(18, 121),
(18, 122),
(18, 83),
(18, 123),
(19, 124),
(19, 125),
(19, 126),
(19, 127),
(19, 128),
(19, 129),
(19, 130),
(19, 131),
(20, 124),
(20, 125),
(20, 132),
(20, 133),
(20, 134),
(20, 135),
(20, 136),
(20, 137);

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
(57, 1, 8),
(52, 2, 9),
(58, 3, 9),
(59, 4, 9),
(60, 4, 9),
(61, 1, 9),
(62, 1, 9),
(63, 1, 9),
(64, 1, 9),
(65, 2, 10),
(65, 3, 10),
(66, 3, 10),
(67, 4, 10),
(68, 5, 10),
(69, 5, 10),
(70, 5, 10),
(71, 5, 10),
(72, 2, 11),
(72, 3, 11),
(72, 4, 11),
(73, 3, 11),
(74, 4, 11),
(75, 4, 11),
(76, 1, 11),
(77, 1, 11),
(78, 1, 11),
(79, 1, 11),
(80, 1, 11),
(81, 1, 11),
(72, 2, 12),
(72, 3, 12),
(72, 4, 12), 
(73, 3, 12), 
(75, 4, 12),
(78, 1, 12),
(82, 4, 12),
(83, 1, 12),
(84, 1, 12),
(85, 1, 12),
(86, 1, 12),
(87, 1, 12),
(88, 1, 12),
(89, 1, 12),
(90, 2, 13), 
(91, 2, 13),
(92, 3, 13),
(93, 4, 13),
(94, 5, 13),
(95, 5, 13),
(96, 5, 13),
(97, 5, 13),
(98, 2, 14),
(98, 3, 14),
(99, 4, 14),
(37, 1, 14),
(100, 1, 14),
(101, 1, 14),
(102, 1, 14),
(103, 1, 14), 
(104, 1, 14),
(98, 2, 15),
(98, 3, 15), 
(105, 4, 15),
(55, 1, 15),
(101, 1, 15),
(106, 1, 15),
(107, 1, 15),
(108, 1, 15),
(98, 2, 16),
(98, 3, 16),
(98, 4, 16),
(109, 4, 16),
(110, 4, 16),
(55, 1, 16),
(37, 1, 16),
(111, 1, 16),
(112, 1, 16),
(113, 1, 16),
(114, 2, 17), 
(114, 4, 17),
(115, 3, 17),
(116, 4, 17),
(117, 1, 17),
(106, 1, 17),
(118, 1, 17),
(56, 1, 17),
(114, 2, 18),
(114, 3, 18),
(114, 4, 18),
(120, 3, 18),
(119, 3, 18),
(121, 3, 18),
(122, 1, 18),
(83, 1, 18),
(123, 1, 18),
(124, 2, 19),
(124, 3, 19),
(124, 4, 19),
(124, 1, 19),
(125, 4, 19),
(126, 4, 19), 
(127, 1, 19),
(128, 1, 19), 
(129, 1, 19),
(130, 1, 19),
(131, 1, 19),
(124, 2, 20),
(124, 3, 20), 
(124, 1, 20),
(125, 4, 20),
(132, 4, 20),
(133, 4, 20),
(134, 1, 20),
(135, 1, 20),
(136, 1, 20),
(137, 1, 20);

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