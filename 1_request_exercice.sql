-- 1. Afficher prénom et nom de tous les auteurs
SELECT first_name, last_name FROM author;

-- 2. Afficher auteurs nés entre 1950 et 1980
SELECT first_name, last_name FROM author WHERE birth_year BETWEEN 1985 AND 1980;

-- 3. Afficher 3 clients les plus récents (par date d’inscription)
SELECT costumer_id FROM costumer ORDER BY join_date DESC LIMIT 3;

-- 4. Liste commandes avec id et montant total renommé "Montant"
SELECT order_id, total_amount AS "Montant" FROM costumer_order;

-- 5. Livres avec stock < 20
SELECT title FROM book WHERE stock < 20;

-- 6. Avis avec note >= 4, afficher note et commentaire
SELECT rating, comment FROM review WHERE rating >= 4;

-- 7. Titres des livres avec année de publication, tri décroissant par année
SELECT title, publication_year ORDER BY publication_year DESC;

-- 8. Commandes au mois de mars 2024
SELECT * FROM costumer_order WHERE oder_date LIKE '____-03-__';

-- 9. Livres dont le titre contient "secret"
SELECT * FROM book WHERE title LIKE '%secret%';

