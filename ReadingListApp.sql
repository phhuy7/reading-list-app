CREATE TABLE Users (
	user_id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
	username VARCHAR(255) UNIQUE NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	password_hash VARCHAR(255) UNIQUE NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE Genres(
	genre_id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
	genre_name VARCHAR(255) UNIQUE NOT NULL
)

CREATE TABLE Books (
	book_id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
	title VARCHAR(255) NOT NULL,
	author VARCHAR(255),
	publication_year INT,
	genre_id uniqueidentifier,
	FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
)

CREATE TABLE ReadingLists(
	list_id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
	list_name VARCHAR(255) NOT NULL,
	user_id uniqueidentifier NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES Users(user_id)
)

CREATE TABLE ListBooks(
	list_book_id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
	list_id uniqueidentifier NOT NULL,
	book_id uniqueidentifier NOT NULL,
	status VARCHAR(50) CHECK (status IN ('to_read', 'reading', ' completed')),
	progress INT CHECK (progress >= 0 AND progress <=100),
	added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(list_id) REFERENCES ReadingLists(list_id),
	FOREIGN KEY (book_id) REFERENCES Books(book_id)
)