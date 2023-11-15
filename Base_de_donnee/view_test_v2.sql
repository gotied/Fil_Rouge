CREATE VIEW produit_categorie
AS
SELECT DISTINCT concat(personne.nm_per, ' ', personne.pm_per) AS cast, film.nm_fil AS film, role.nm_ro AS role
FROM r_film_perso
JOIN personne ON r_film_perso.id_per = personne.id_per
JOIN film ON r_film_perso.id_fil = film.id_fil
JOIN r_role_perso ON personne.id_per = r_role_perso.id_per
JOIN role ON r_role_perso.id_ro = role.id_ro  
ORDER BY film ASC;

CREATE VIEW produit_categorie_2
AS
SELECT film.nm_fil AS film, genre.nm_gen AS genre
FROM r_genre_film
JOIN film ON r_genre_film.id_fil = film.id_fil
JOIN genre ON r_genre_film.id_gen = genre.id_gen;

CREATE VIEW produit_fournisseur
AS
SELECT f.nm_fil AS film, fr.nm_four AS fournisseur
FROM film f
JOIN r_fourni_film rf ON f.id_fil = rf.id_fil
JOIN fournisseur fr ON rf.id_four = fr.id_four;