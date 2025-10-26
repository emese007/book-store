-- Création des tables

CREATE TABLE theme (
    theme_id INTEGER PRIMARY KEY,
    theme_name VARCHAR(100) NOT NULL
);

CREATE TABLE author (
    author_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_year INTEGER
);

CREATE TABLE book (
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INTEGER NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INTEGER NOT NULL,
    publication_year INTEGER,
    theme_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    FOREIGN KEY (theme_id) REFERENCES theme(theme_id)
);

CREATE TABLE customer (
    customer_id INTEGER PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    join_date DATE
);

CREATE TABLE customer_order (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE review (
    review_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);
