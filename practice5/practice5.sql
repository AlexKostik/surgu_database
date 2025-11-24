CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publish_year INT NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

ALTER TABLE books ADD COLUMN genre VARCHAR(100);
ALTER TABLE books ADD CONSTRAINT check_publish_year CHECK (publish_year < 2025);
ALTER TABLE books DROP COLUMN author_id;

CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE Temp_Table (
    temp_id INT PRIMARY KEY,
    temp_data VARCHAR(100)
);
DROP TABLE Temp_Table;