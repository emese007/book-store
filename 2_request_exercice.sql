-- 1. Affichez la somme totale des stocks de livres.
SELECT SUM(stock) AS total_stock
FROM book

-- 2. Affichez pour chaque auteur le nombre de livres écrits.
SELECT a.first_name, a.last_name, COUNT(b.author_id) AS number_of_books
FROM author a
JOIN book b ON a.author_id = b.author_id
GROUP BY a.author_id;

-- 3. Affichez le titre du livre, nom complet de l’auteur, et nom du thème.
SELECT a.title, b.first_name, b.last_name, c.theme_name
FROM book a
JOIN author b ON a.author_id = b.author_id
JOIN theme c ON a.theme_id = c.theme_id;

-- 4. Affichez toutes les commandes d’un client donné avec titre du livre et date de commande.
SELECT a.customer_id, b.order_id, b.order_date, c.title
FROM customer a
JOIN customer_order b ON a.customer_id = b.customer_id
JOIN book c ON c.book_id = b.book_id
ORDER BY a.customer_id ASC;

-- 5. Affichez la moyenne des notes pour chaque livre ayant au moins 3 avis.

SELECT b.titre, AVG(r.note) AS moyenne_note, COUNT(r.review_id) AS nb_avis
FROM book b
JOIN review r ON b.book_id = r.book_id
GROUP BY b.book_id, b.titre
HAVING COUNT(r.review_id) >= 3;

-- 6. Affichez le nombre total de commandes passées par chaque client (email+nb commandes.
SELECT c.email, o.order_id AS number_of_orders
FROM customer c
JOIN customer_order o ON c.customer_id = o.customer_id
GROUP BY c.email;

-- 7. Affichez les titres des livres qui n’ont jamais été commandés.
SELECT b.title
FROM book b
LEFT JOIN customer_order co ON b.book_id = co.book_id;
WHERE co.book_id IS NULL;

-- 8. Affichez le chiffre d’affaires total généré par chaque auteur (somme des prix des livres commandés).
SELECT a.first_name, a.last_name, SUM(b.price) AS chiffre_affaires
FROM author a
JOIN book b ON a.author_id = b.author_id
JOIN customer_order co ON b.book_id = co.book_id
GROUP BY a.author_id, a.first_name, a.last_name;



