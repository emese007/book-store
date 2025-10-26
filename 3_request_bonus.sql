-- Bonus SQL

-- 1. Trouver les 3 auteurs dont les livres ont généré le plus de chiffre d’affaires total.
    SELECT 
        a.author_id,
        a.first_name ||' '|| a.last_name AS author,
        SUM(b.price * co.total_amount) AS total_revenue 
    FROM customer_order co 
    JOIN book b ON b.book_id = co.book_id
    JOIN author a ON a.author_id = b.author_id
    GROUP BY a.author_id, author
    ORDER BY total_revenue DESC
    LIMIT 3;

-- 2. Calculer le total des ventes par thème de livre, classé du plus au moins vendu (en montant).
    SELECT 
        t.theme_id, t.theme_name,
        SUM(b.price * co.total_amount) AS revenu_par_theme
    FROM customer_order co 
    JOIN book b ON b.book_id = co.book_id
    JOIN theme t ON t.theme_id = b.theme_id
    GROUP BY t.theme_id, t.theme_name
    ORDER BY revenu_par_theme DESC;

-- 3. Afficher pour chaque mois de l’année 2024 le nombre de commandes passées et le chiffre d’affaires total.
    SELECT 
        strftime('%Y', co.order_date) AS year,
        strftime('%m', co.order_date) AS month,
        COUNT(co.order_id) AS nb_orders,
        SUM(b.price) AS total_sales
    FROM customer_order co
    JOIN book b ON co.book_id = b.book_id
    WHERE strftime('%Y', co.order_date) = '2024'
    GROUP BY year, month
    ORDER BY year, month;

-- 4. Pour chaque auteur, calculer la moyenne des notes des livres écrits, y compris les auteurs dont livres n’ont pas encore d’avis (afficher NULL dans ce cas).
    SELECT 
        a.author_id,
        a.first_name,
        a.last_name,
        AVG(r.rating) AS avg_rating
    FROM author a
    JOIN book b ON a.author_id = b.author_id
    LEFT JOIN review r ON b.book_id = r.book_id
    GROUP BY a.author_id, a.first_name, a.last_name
    ORDER BY a.last_name, a.first_name;

-- 5. Afficher les commandes les plus récentes pour chaque client (1 commande max par client).
    SELECT 
    co.*
    FROM customer_order co
    JOIN (SELECT customer_id, MAX(order_date) AS last_order_date
        FROM customer_order
        GROUP BY customer_id) 
        last_orders ON co.customer_id = last_orders.customer_id AND co.order_date = last_orders.last_order_date;