USE filmo;

-- Insertion des genres
INSERT INTO genre (nom) VALUES 
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
('Biopic'), -- 12
('Historique'), -- 13
('Epouvante-horreur'); -- 14

-- Insertion des personnes
INSERT INTO personne (prenom, nom) VALUES
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
('Toni', 'Collette'), -- 137
('Ridley', 'Scott'), -- 138
('David', 'Franzoni'), -- 139
('John', 'Logan'), -- 140
('William', 'Nicholson'), -- 141
('Douglas', 'Wick'), -- 142
('Branko', 'Lustig'), -- 143
('Russell', 'Crowe'), -- 144
('Connie', 'Nielsen'), -- 145
('Oliver', 'Reed'), -- 146
('Djimon', 'Hounsou'), -- 147
('Richard', 'Harris'), -- 148
('William', 'Monahan'), -- 149
('Orlando', 'Bloom'), -- 150
('Eva', 'Green'), -- 151
('Jeremy', 'Irons'), -- 152
('David', 'Thewlis'), -- 153
('Stanley', 'Kubrick'), -- 154
('Brian W.', 'Cook'), -- 155
('Diane', 'Johnson'), -- 156
('Jack', 'Nicholson'), -- 157
('Shelley', 'Duvall'), -- 158
('Danny', 'Lloyd'), -- 159
('Denis', 'Villeneuve'), -- 160
('Aaron', 'Guzikowski'), -- 161
('Kira', 'Davis'), -- 162
('Broderick', 'Johnson'), -- 163
('Adam', 'Kolbrenner'), -- 164
('Andrew', 'Kosove'), -- 165
('Mark', 'Wahlberg'), -- 166
('Robyn', 'Meisinger'), -- 167
('Hugh', 'Jackman'), -- 168
('Jake', 'Gyllenhaal'), -- 169
('Viola', 'Davis'), -- 170
('Maria', 'Bello'), -- 171
('Terrence', 'Howard'), -- 172
('Paul', 'Dano'), -- 173
('Matthew', 'Vaughn'), -- 174
('Jane', 'Goldman'), -- 175
('Adam', 'Bohling'), -- 176
('Tarquin', 'Pack'), -- 177
('David', 'Reid'), -- 178
('Kris', 'Thykier'), -- 179
('Aaron Taylor-', 'Johnson'), -- 180
('Chloë Grace', 'Moretz'), -- 181
('Nicolas', 'Cage'), -- 182
('Christopher', 'Mintz-Plasse'), -- 183
('Mark', 'Strong'), -- 184
('James', 'Cameron'), -- 185
('William', 'Wisher Jr'), -- 186
('Arnold', 'Schwarzenegger'), -- 187
('Edward', 'Furlong'), -- 188
('Linda', 'Hamilton'), -- 189
('Robert', 'Patrick'), -- 190
('Joe', 'Morton'), -- 191
('Luc', 'Besson'), -- 192
('Robert Mark', 'Kamen'), -- 193
('Patrice', 'Ledoux'), -- 194
('Bruce', 'Willis'), -- 195
('Milla', 'Jovovich'), -- 196
('Ian', 'Holm'), -- 197
('Chris', 'Tucker'), -- 198
('James', 'Mangold'), -- 199
('Halsted', 'Welles'), -- 200
('Michael', 'Brandt'), -- 201
('Derek', 'Haas'), -- 202
('Cathy', 'Konrad'), -- 203
('Ben', 'Foster'), -- 204
('Logan', 'Lerman'), -- 205
('George', 'Miller'), -- 206
('Brendan', 'McCarthy'), -- 207
('Nick', 'Lathouris'), -- 208
('Doug', 'Mitchell'), -- 209
('P. J.', 'Voeten'), -- 210
('Tom', 'Hardy'), -- 211
('Charlize', 'Theron'), -- 212
('Hugh', 'Keays-Byrne'), -- 213
('Nicholas', 'Hoult'), -- 214
('Scott', 'Derrickson'), -- 215
('C. Robert', 'Cargill'), -- 216
('Jason', 'Blum'), -- 217
('Brian', 'Kavanaugh-Jones'), -- 218
('Ethan', 'Hawke'), -- 219
('Juliet', 'Rylance'); -- 220

-- Insertion des rôles
INSERT INTO role (nom) VALUES 
('Acteur'), -- 1
('Réalisateur'), -- 2
('Scénariste'), -- 3
('Producteur'), -- 4
('Doubleur'); -- 5

-- Insertion des fournisseurs
INSERT INTO fournisseur (nom, adresse, telephone, email) VALUES
('MovieSupplier1', '123 Main St, City', '0234567890', 'supplier@test.com'),
('MovieSupplier2', '456 Oak St, Town', '0876543210', 'supplier@test.com');

-- Insertion des utilisateurs
INSERT INTO utilisateur (email, password, nom, prenom, telephone, role, coefficient, responsable_id) VALUES
-- client particulier
('john@test.com', 'test', 'Smith', 'John', '0612345678', 0, 1.2, NULL), -- 1
('jane@test.com', 'test', 'Johnson', 'Jane', '0623456789', 0, 1.2, NULL), -- 2
('bob@test.com', 'test', 'Doe', 'Bob', '0634567890', 0, 1.2, NULL), -- 3
('alice@test.com', 'test', 'Miller', 'Alice', '0645678901', 0, 1.2, NULL), -- 4
('sophie@test.com', 'test', 'Lefèvre', 'Sophie', '0601122334', 0, 1.2, NULL), -- 5
('adam@test.com', 'test', 'Moreau', 'Adam', '0678765432', 0, 1.2, NULL), -- 6
('clara@test.com', 'test', 'Dubois', 'Clara', '0654345678', 0, 1.2, NULL), -- 7
('mohamed@test.com', 'test', 'Bouvier', 'Mohamed', '0687654321', 0, 1.2, NULL), -- 8
('zoé@test.com', 'test', 'Bonnet', 'Zoé', '0654321098', 0, 1.2, NULL), -- 9
-- client pro
('lucie@test.com', 'test', 'Leroux', 'Lucie', '0679911234', 1, 2.2, NULL), -- 10
('nathan@test.com', 'test', 'Roux', 'Nathan', '0615365678', 1, 3.2, NULL), -- 11
('léa@test.com', 'test', 'Fournier', 'Léa', '0690123456', 1, 2.5, NULL), -- 12
-- commercial particulier
('commercial@test.com', 'test', 'Harris', 'William', '0612345879', 2, NULL, NULL), -- 13
-- commercial pro
('commercial@test.com', 'test', 'Girard', 'Hugo', '0678901234', 3, NULL, NULL), -- 14
-- gérant 
('jean@test.com', 'test', 'Garnier', 'Jean', '0609876543', 4, NULL, NULL); -- 15

-- Attribution des utilisateurs gérés
UPDATE utilisateur SET responsable_id = 13 WHERE id_uti IN (1, 2, 3, 4, 5, 6, 7, 8, 9);
UPDATE utilisateur SET responsable_id = 14 WHERE id_uti IN (10, 11, 12);
-- UPDATE utilisateur SET responsable_id = 15 WHERE id_uti IN (13, 14);

-- Insertion des commandes
INSERT INTO commande (date_commande, total, etat, id_uti) VALUES
('2022-03-01 12:00:00', 25.98, 3, 1), -- 1
('2022-04-02 15:30:00', 27.98, 2, 2), -- 2
('2022-05-03 18:45:00', 66.95, 3, 1), -- 3
('2022-06-01 14:00:00', 23.98, 1, 4), -- 4
('2022-07-02 16:45:00', 23.98, 2, 5), -- 5
('2023-01-10 08:15:00', 32.97, 3, 7), -- 6
('2023-02-15 17:30:00', 24.97, 0, 9), -- 7
('2023-03-20 13:45:00', 59.90, 2, 11), -- 8
('2023-04-25 09:30:00', 24.98, 1, 3), -- 9
('2023-05-30 14:45:00', 33.96, 3, 6), -- 10
('2023-07-05 11:00:00', 7.99, 4, 8), -- 11
('2023-08-10 16:15:00', 269.70, 2, 10), -- 12
('2023-09-15 12:30:00', 17.98, 1, 4), -- 13
('2023-10-20 14:45:00', 199.80, 3, 12), -- 14
('2023-11-25 10:00:00', 20.98, 2, 5), -- 15
('2023-12-25 18:15:00', 47.96, 1, 1), -- 16
('2024-01-05 14:30:00', 30.97, 3, 9), -- 17
('2024-02-10 09:45:00', 33.96, 2, 2), -- 18
('2024-03-15 16:00:00', 20.98, 1, 4), -- 19
('2024-04-20 12:15:00', 23.97, 3, 6); -- 20

-- Insertion des films
INSERT INTO produit (titre, sypnopsis, date_sortie, duree, image, prix_ht, prix_four, stock, actif) VALUES
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
('Sixième Sens', "Cole Sear, garçonnet de huit ans, est hanté par un terrible secret.\nSon imaginaire est visité par des esprits menaçants.\nTrop jeune pour comprendre le pourquoi de ces apparitions et traumatisé par ces pouvoirs paranormaux, Cole s'enferme dans une peur maladive et ne veut révéler à personne la cause de son enfermement, à l'exception d'un psychologue pour enfants.\nLa recherche d'une explication rationnelle guidera l'enfant et le thérapeute vers une vérité foudroyante et inexplicable.", '1999-08-02', '1h47', 'sixieme_sens.webp', 6.99, 1.99, 150, true),
('Gladiator', "Le général romain Maximus est le plus fidèle soutien de l'empereur Marc Aurèle, qu'il a conduit de victoire en victoire avec une bravoure et un dévouement exemplaires.\nJaloux du prestige de Maximus, et plus encore de l'amour que lui voue l'empereur, le fils de MarcAurèle, Commode, s'arroge brutalement le pouvoir, puis ordonne l'arrestation du général et son exécution.\nMaximus échappe à ses assassins mais ne peut empêcher le massacre de sa famille. Capturé par un marchand d'esclaves, il devient gladiateur et prépare sa vengeance.", '2000-05-1', '2h35', 'gladiator.webp', 9.99, 4.99, 200, true),
('Kingdom of Heaven', "L'aventure extraordinaire d'un homme ordinaire, précipité dans un conflit qui va durer des décennies : les croisades.\nEtranger sur une terre qui lui est étrangère, il va servir un roi condamné, s'éprendre d'une troublante et inaccessible reine avant d'être fait chevalier.\nIl lui faudra protéger les habitants de Jérusalem, dont une immense armée a entrepris le siège, sans jamais cesser de lutter pour maintenir une paix fragile...", '2005-05-6', '2h25', 'kingdom_of_heaven.webp', 10.99, 4.99, 250, true),
('Shining', "Écrivain, Jack Torrance est engagé comme gardien, pendant tout l’hiver, d’un grand hôtel isolé du Colorado – l’Overlook – où il espère surmonter enfin sa panne d’inspiration.\nIl s’y installe avec sa femme Wendy et son fils Danny, doté d’un don de médium.\nTandis que Jack n’avance pas dans son livre et que son fils est de plus en plus hanté par des visions terrifiantes, il découvre les terribles secrets de l’hôtel et bascule peu à peu dans une forme de folie meurtrière où il s’en prend à sa propre famille…", '1980-05-23', '2h23', 'shining.webp', 8.99, 3.99, 100, true),
('Prisoners', "Dans la banlieue de Boston, deux fillettes de 6 ans, Anna et Joy, ont disparu.\nLe détective Loki privilégie la thèse du kidnapping suite au témoignage de Keller, le père d’Anna.\nLe suspect numéro 1 est rapidement arrêté mais est relâché quelques jours plus tard faute de preuve, entraînant la fureur de Keller.\nAveuglé par sa douleur, le père dévasté se lance alors dans une course contre la montre pour retrouver les enfants disparus.\nDe son côté, Loki essaie de trouver des indices pour arrêter le coupable avant que Keller ne commette l’irréparable…\nLes jours passent et les chances de retrouver les fillettes s’amenuisent…", '2013-09-20', '2h33', 'prisoners.webp', 7.99, 3.99, 200, true),
('Kick-Ass', "Dave Lizewski est un adolescent gavé de comics qui ne vit que pour ce monde de super-héros et d'incroyables aventures.\nDécidé à vivre son obsession jusque dans la réalité, il se choisit un nom – Kick-Ass – se fabrique lui-même un costume, et se lance dans une bataille effrénée contre le crime.\nDans son délire, il n'a qu'un seul problème : Kick-Ass n'a pas le moindre superpouvoir... Le voilà pourchassé par toutes les brutes de la ville.\nMais Kick-Ass s'associe bientôt à d'autres délirants copycats décidés eux aussi à faire régner la justice.\nParmi eux, une enfant de 11 ans, Hit Girl et son père Big Daddy, mais aussi Red Mist.\nLe parrain de la mafia locale, Frank D'Amico, va leur donner l'occasion de montrer ce dont ils sont capables...", '2010-03-26', '1h57', 'kick_ass.webp', 10.99, 3.99, 300, true),
('Terminator 2 : Le Jugement dernier', "En 1997, les survivants de l'apocalypse nucléaire poursuivent une guerre sans merci contre les robots et machines qu'ils ont eux-même créés.\nPour en finir avec John Connor qui dirige la résistance des hommes, deux cyborgs sont envoyés dans le passé.\nLeur mission : abattre Connor enfant. Le premier modèle de la série Terminator a échoué en 1984.\nLe second, modèle plus performant en liquide métamorphosable, se lance à la poursuite de l'enfant et de sa mère, Sarah, dans les années quatre-vingt-dix.\nDe leur côté, les hommes du futur ont envoyé dans le passé un Terminator chargé de protéger le jeune Connor.\nLe duel des robots va prendre alors des allures titanesques. Et, tandis que l'enfant enseignera à ce Terminator des rudiments d'humanité, sa mère tentera par tous les moyens d'empêcher la création des premières machines intelligentes.\nAvec l'aide du Terminator qu'ils ont éduqué, ils combattront pour influencer le futur...", '1991-07-03', '2h17', 'terminator_2.webp', 9.99, 2.99, 300, true),
('Le Cinquième Élément', "Au XXIII siècle, dans un univers étrange et coloré, où tout espoir de survie est impossible sans la découverte du cinquième élément, un héros affronte le mal pour sauver l'humanité.", '1997-05-07', '2h06', 'cinquieme_element.webp', 9.99, 3.99, 200, true),
('3h10 pour Yuma', "Revenu blessé de la guerre de Sécession, Dan Evans a établi sa famille dans un ranch.\nLa sécheresse a ravagé ses terres, décimé son troupeau et miné la considération que lui portent sa femme et ses enfants, en particulier son aîné Will, âgé de 14 ans.\nA la suite d'une attaque de diligence, le célèbre bandit Ben Wade passe par la ville de Bisbee où il est arrêté avec le concours fortuit de Evans.\nRecherché pour ses hold-up et ses meurtres répétés, Wade doit être convoyé vers Contention, à trois jours de cheval, pour embarquer sur un train à destination de Yuma, où se trouve le tribunal fédéral.\nContre une prime qui peut sauver son ranch, Dan Evans s'engage dans l'escorte qui doit accompagner le dangereux criminel.\nIl est bientôt rejoint par son fils Will, fasciné par l'aura du tueur.\nTandis que son gang organise son évasion, Wade engage sur le chemin de Contention un bras de fer psychologique avec ses gardiens, usant à la fois de la peur qu'il leur inspire et de la séduction qu'il exerce sur eux...", '2007-09-07', '2h02', '3h10_pour_yuma.webp', 12.99, 4.99, 200, true),
('Mad Max: Fury Road', "Hanté par un lourd passé, Mad Max estime que le meilleur moyen de survivre est de rester seul.\nCependant, il se retrouve embarqué par une bande qui parcourt la Désolation à bord d'un véhicule militaire piloté par l'Imperator Furiosa.\nIls fuient la Citadelle où sévit le terrible Immortan Joe qui s'est fait voler un objet irremplaçable.\nEnragé, ce Seigneur de guerre envoie ses hommes pour traquer les rebelles impitoyablement…", '2015-05-15', '2h00', 'madmax_fury_road.webp', 9.99, 2.99, 250, true),
('Sinister', "Ellison est un auteur de romans policiers inspirés de faits réels.\nDans l’espoir d’écrire un nouveau livre à succès, il emménage avec sa famille dans une maison où les anciens propriétaires ont été retrouvés inexplicablement pendus.\nEllison y découvre dans le grenier des bobines 8mm contenant les images de meurtres d’autres familles.\nQui a filmé ces tueries et pour quelle raison ?\nEllison va tenter de répondre à ces questions tandis que le tueur présumé, une entité surnaturelle présente sur les films, menace de plus en plus sa famille.", '2012-10-5', '1h50', 'sinister.webp', 7.99, 1.99, 150, true);

-- Attribution des genres aux films
INSERT INTO r_genre_film (id_pro, id_gen) VALUES
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
(20, 3),
(21, 1),
(21, 6),
(21, 13),
(22, 1),
(22, 13),
(23, 14),
(23, 5),
(24, 5),
(25, 1),
(25, 3),
(26, 4),
(26, 1),
(27, 1),
(27, 4),
(28, 11),
(28, 3),
(29, 1),
(29, 4),
(30, 14),
(30, 5);

-- Attribution des personnes aux films avec leurs rôles
INSERT INTO r_film_perso (id_pro, id_per) VALUES
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
(20, 137),
(21, 138),
(21, 139),
(21, 140),
(21, 141),
(21, 142),
(21, 143),
(21, 144),
(21, 128),
(21, 145),
(21, 146),
(21, 147),
(21, 148),
(22, 138),
(22, 149),
(22, 150),
(22, 151),
(22, 152),
(22, 153),
(23, 154),
(23, 155),
(23, 156),
(23, 157),
(23, 158),
(23, 159),
(24, 160),
(24, 161),
(24, 162),
(24, 163),
(24, 164),
(24, 165),
(24, 166),
(24, 167),
(24, 168),
(24, 169),
(24, 170),
(24, 171),
(24, 172),
(24, 173),
(25, 174),
(25, 175),
(25, 37),
(25, 176),
(25, 177),
(25, 178),
(25, 179),
(25, 180),
(25, 181),
(25, 182),
(25, 183),
(25, 184),
(26, 185),
(26, 186),
(26, 187),
(26, 188),
(26, 189),
(26, 190),
(26, 191),
(27, 192),
(27, 193),
(27, 194),
(27, 195),
(27, 196),
(27, 86),
(27, 197),
(27, 198),
(28, 199),
(28, 200),
(28, 201),
(28, 202),
(28, 203),
(28, 144),
(28, 83),
(28, 204),
(28, 205),
(29, 206),
(29, 207),
(29, 208),
(29, 209),
(29, 210),
(29, 211),
(29, 212),
(29, 213),
(29, 214),
(30, 215),
(30, 216),
(30, 217),
(30, 218),
(30, 219),
(30, 220);

INSERT INTO r_role_perso (id_per, id_ro, id_pro) VALUES
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
(137, 1, 20),
(138, 2, 21),
(139, 3, 21),
(140, 3, 21),
(141, 3, 21),
(142, 4, 21),
(143, 4, 21),
(145, 1, 21),
(128, 1, 21),
(146, 1, 21),
(147, 1, 21),
(148, 1, 21),
(138, 2, 22),
(149, 3, 22),
(150, 1, 22),
(151, 1, 22),
(152, 1, 22),
(153, 1, 22),
(154, 2, 23),
(154, 3, 23),
(154, 4, 23),
(155, 2, 23),
(156, 3, 23),
(157, 1, 23),
(158, 1, 23),
(159, 1, 23),
(160, 2, 24),
(161, 3, 24),
(162, 4, 24),
(163, 4, 24),
(164, 4, 24),
(165, 4, 24),
(166, 4, 24),
(167, 4, 24),
(168, 1, 24),
(169, 1, 24),
(170, 1, 24),
(171, 1, 24),
(172, 1, 24),
(173, 1, 24),
(174, 2, 25),
(174, 3, 25),
(174, 4, 25),
(175, 3, 25),
(37, 4, 25),
(176, 4, 25),
(177, 4, 25),
(178, 4, 25),
(179, 4, 25),
(180, 1, 25),
(181, 1, 25),
(182, 1, 25),
(183, 1, 25),
(184, 1, 25),
(185, 2, 26),
(185, 3, 26),
(185, 4, 26),
(186, 3, 26),
(187, 1, 26),
(188, 1, 26),
(189, 1, 26),
(190, 1, 26),
(191, 1, 26),
(192, 2, 27),
(192, 3, 27),
(193, 3, 27),
(194, 4, 27),
(195, 1, 27),
(196, 1, 27),
(86, 1, 27),
(197, 1, 27),
(198, 1, 27),
(199, 2, 28),
(200, 3, 28),
(201, 3, 28),
(202, 3, 28),
(203, 4, 28),
(144, 1, 28),
(83, 1, 28),
(204, 1, 28),
(205, 1, 28),
(206, 2, 29),
(206, 3, 29),
(206, 4, 29),
(207, 3, 29),
(208, 3, 29),
(209, 4, 29),
(210, 4, 29),
(211, 1, 29),
(212, 1, 29),
(213, 1, 29),
(214, 1, 29),
(215, 2, 30),
(215, 3, 30),
(216, 3, 30),
(217, 4, 30),
(218, 4, 30),
(219, 1, 30),
(220, 1, 30);

-- Insertion des détails des commandes
INSERT INTO details (id_pro, id_co, qte) VALUES
(1, 1, 2), 
(2, 2, 2), 
(1, 3, 3), 
(2, 3, 2), 
(3, 4, 2), 
(4, 5, 1), 
(3, 5, 1),
(10, 6, 1),
(4, 6, 1),
(13, 6, 1),
(14, 7, 1),
(15, 7, 1),
(16, 7, 1),
(17, 8, 10), 
(7, 9, 1),
(6, 9, 1),
(30, 10, 2),
(23, 10, 2),
(20, 11, 1),
(9, 12, 15),
(8, 12, 15),
(25, 13, 1),
(13, 13, 1),
(26, 14, 20),
(28, 15, 1),
(15, 15, 1),
(12, 16, 1),
(11, 16, 1),
(1, 16, 1),
(3, 16, 1),
(27, 17, 1),
(29, 17, 1),
(22, 17, 1),
(5, 18, 1),
(8, 18, 1),
(9, 18, 1),
(17, 18, 1),
(21, 19, 1),
(22, 19, 1),
(24, 20, 1),
(15, 20, 1),
(19, 20, 1);

-- Insertion des adresses
INSERT INTO adresse (livr_ad, fac_ad, id_uti) VALUES
('123 Shipping St, City', '456 Billing St, City', 1),
('789 Delivery St, Town', '101 Invoicing St, Town', 2),
('42 Starlight Lane, Celestia City', '42 Starlight Lane, Celestia City', 3),
('101 Galaxy View, Nebula Town', '456 Comet Boulevard, Nebula Town', 4),
('12 Enchanted Avenue, Fairytale City', '345 Magic Street, Fairytale City', 5),
('1 Sunshine Road, Sunnyville', '1 Sunshine Road, Sunnyville', 6),
('22 Riverbank Drive, Riverside', '22 Riverbank Drive, Riverside', 7),
('5 Mountain Top, Peaksville', '5 Mountain Top, Peaksville', 8),
('8 Meadow Lane, Meadowville', '8 Meadow Lane, Meadowville', 9),
('456 Business Park, Commercial City', '789 Corporate Avenue, Commercial City', 10),
('101 Industrial Zone, Industrial Town', '222 Factory Street, Industrial Town', 11),
('25 Office Plaza, Officeville', '333 Executive Street, Officeville', 12);

-- Insertion des factures
INSERT INTO facture (fac, mdp_fac, dt_fac, id_co) VALUES
('INV001', 'Carte Bancaire', '2022-03-01', 1),
('INV002', 'Carte Bancaire', '2022-04-02', 2),
('INV003', 'Carte Bancaire', '2022-05-03', 3),
('INV004', 'Carte Bancaire', '2022-06-01', 4),
('INV005', 'Carte Bancaire', '2022-07-02', 5),
('INV006', 'Carte Bancaire', '2023-01-10', 6),
('INV007', 'Carte Bancaire', '2023-02-15', 7),
('INV008', 'Cheque', NULL, 8),
('INV009', 'Carte Bancaire', '2023-04-25', 9),
('INV010', 'Carte Bancaire', '2023-05-30', 10),
('INV011', 'Carte Bancaire', '2023-07-05', 11),
('INV012', 'Cheque', '2023-08-20', 12),
('INV013', 'Carte Bancaire', '2023-09-15', 13),
('INV014', 'Cheque', '2023-11-01', 14),
('INV015', 'Carte Bancaire', '2023-11-25', 15),
('INV016', 'Carte Bancaire', '2023-12-25', 16),
('INV017', 'Carte Bancaire', '2024-01-05', 17),
('INV018', 'Carte Bancaire', '2024-02-10', 18),
('INV019', 'Carte Bancaire', '2024-03-15', 19),
('INV020', 'Carte Bancaire', '2024-04-20', 20);

-- Insertion des fournisseurs pour les films
INSERT INTO r_fourni_film (id_pro, id_four) VALUES
(1, 1), 
(2, 1), 
(3, 2), 
(4, 2),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 1),
(10, 2),
(11, 1),
(12, 1),
(13, 2),
(14, 2),
(15, 1),
(16, 2),
(17, 1),
(18, 2),
(19, 1),
(20, 1),
(21, 2),
(22, 2),
(23, 1),
(24, 2),
(25, 1),
(26, 1),
(27, 2),
(28, 2),
(29, 1),
(30, 2);

-- Insertion des livraisons
INSERT INTO livraison (bn_livr, dt_lirv, id_co) VALUES
('Delivery1', '2022-03-04', 1),
('Delivery2', '2022-03-05', 2),
('Delivery3', '2022-03-06', 3),
('Delivery4', '2022-06-04', 4),
('Delivery5', '2022-06-05', 5),
('Delivery6', '2023-01-13', 6),
('Delivery7', '2023-02-18', 7),
('Delivery8', '2023-03-25', 8),
('Delivery9', '2023-04-28', 9),
('Delivery10', '2023-06-03', 10),
('Delivery11', '2023-07-08', 11),
('Delivery12', '2023-08-15', 12),
('Delivery13', '2023-09-18', 13),
('Delivery14', '2023-10-25', 14),
('Delivery15', '2023-11-28', 15),
('Delivery16', '2023-12-28', 16),
('Delivery17', '2024-01-08', 17),
('Delivery18', '2024-02-13', 18),
('Delivery19', '2024-03-18', 19),
('Delivery20', '2024-04-23', 20);