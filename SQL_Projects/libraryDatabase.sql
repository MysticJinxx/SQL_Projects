CREATE DATABASE dbLibrary
USE dbLibrary

/*************************************
				TABLES
*************************************/

CREATE TABLE libraryBranch (
	branchID int NOT NULL PRIMARY KEY IDENTITY (1,1),
	branchName varchar(30) NOT NULL,
	address varchar(30) NOT NULL
);

CREATE TABLE publisher (
	publisherName varchar(30) NOT NULL PRIMARY KEY,
	publisherAddress varchar(100) NOT NULL,
	phone varchar(15)
);

CREATE TABLE books (
	bookID int NOT NULL PRIMARY KEY IDENTITY (1,1),
	title varchar (30) NOT NULL,
	publisherName varchar(30) FOREIGN KEY REFERENCES publisher(publisherName)
);


CREATE TABLE bookCopies (
	bookID int FOREIGN KEY REFERENCES books(bookID),
	branchID int FOREIGN KEY REFERENCES libraryBranch(branchID),
	Number_of_Copies int NOT NULL
);

CREATE TABLE bookAuthors (
	bookID int FOREIGN KEY REFERENCES books(bookID),
	authorName varchar(30) NOT NULL
);

CREATE TABLE borrower (
	cardNo int NOT NULL PRIMARY KEY,
	borrowerName varchar(30) NOT NULL,
	borrowerAddress varchar(30),
	borrowerPhone varchar(15) NOT NULL
);

CREATE TABLE bookLoans (
	bookID int FOREIGN KEY REFERENCES books(bookID),
	branchID int FOREIGN KEY REFERENCES libraryBranch(branchID),
	cardNo int FOREIGN KEY REFERENCES borrower(cardNo),
	dateOut date NOT NULL,
	dateDue date NOT NULL
);


/*************************************
				INSERTS
*************************************/

INSERT INTO libraryBranch
	VALUES
	('Sharpstown', '7660 Clarewood Dr.'),
	('Orlando', '101 E Central Blvd.'),
	('Winter Park', '1052 W Morse Blvd.'),
	('Anaheim', '500 W Broadway'),
	('Multnomah', '2300 NW Thurman St.'),
	('Hellertown', '409 Constitution Ave.')
;

SELECT * FROM libraryBranch;

INSERT INTO borrower (cardNo, borrowerName, borrowerAddress, borrowerPhone)
	VALUES
	(100, 'Homer Simpson', '742 Evergreen Terrace', '123-456-7890'),
	(101, 'Steve Smith', '1024 Cherry Street', '098-765-4321'),
	(102, 'Jon Bellion', '234 New York Dr.', '134-234-8594'),
	(103, 'Billy Kid', '123 Boot Hill', '441-532-5832'),
	(104, 'John Jones', '4911 Boring Name Rd.', '111-249-9022'),
	(105, 'Gavin Buzzard', '2001 Goldenrod Rd.', '040-111-4299'),
	(106, 'Crazy Guy', '200 Who Knows Dr.', '100-444-5299'),
	(107, 'Tony Tony', '123 Balogna Ave.', '231-232-1521')
;

SELECT * FROM borrower;

INSERT INTO publisher (publisherName, publisherAddress, phone)
	VALUES
	('Legacy Book Publishing', '1234 Book Reader Rd, New York, NY', '407-647-3787'),
	('First Editing', '3535 Woodrow Dr., Orlando, FL', '321-251-6977'),
	('Xulon Press', '2301 Lucien Way, Houton TX', '407-339-4217'),
	('DAW', '222 Daw Lane, New York, NY', '555-245-1566'),
	('Persea Books', '635 Persea Rd. SanFranciso CA', '661-252-6311'),
	('Source Books', '000 Source, Seattle, WA', '512-125-1266'),
	('Turner Books', '5656 Turner Ave., Denver, CO', '512-123-1216'),
	('ABDO Books', '1823 Crazy Lane, Austin TX', '923-123-1255'),
	('Black and White', '1232 Named After Colors, Richmond, VA', '512-125-1266'),
	('Tor/Forge', '111 Elbow Macaroni, Philadelphia, PA', '512-125-1266')
;

SELECT * FROM publisher;

INSERT INTO books
	VALUES
	('The Lost Tribe', 'First Editing'),
	('The Giver', 'ABDO Books'),
	('The Lord of The Rings', 'Persea Books'),
	('The Great Gatsby', 'Xulon Press'),
	('Lord of The Flies', 'DAW'),
	('Catcher in The Rye', 'Persea Books'),
	('How To Kill A Mockingbird', 'Legacy Book Publishing'),
	('Hatchet', 'Tor/Forge'),
	('Warriors', 'First Editing'),
	('Twilight', 'Persea Books'),
	('Of Mice and Men', 'First Editing'),
	('Ghostbumps', 'Turner Books'),
	('The Magic Treehouse', 'Black and White'),
	('IT', 'Tor/Forge'),
	('Fourth Wing', 'ABDO Books'),
	('Iron Flame', 'Persea Books'),
	('King of Pride', 'Turner Books'),
	('The Housemaid', 'First Editing'),
	('The Covenant of Water', 'Persea Books'),
	('A Court of Thorns and Roses', 'Black and White')
;
SELECT * FROM books;

INSERT INTO bookAuthors (bookID, authorName)
	VALUES
	(1, 'Forest Gump'),
	(2, 'Joe Joe'),
	(3, 'Susan Krebople'),
	(4, 'Crazy Earl'),
	(5, 'Pumpkin Kim'),
	(6, 'Susan Earl'),
	(7, 'Gerard Way'),
	(8, 'Apple Fritter'),
	(9, 'Uncle Bumpkin'),
	(10, 'Gerard Way'),
	(11, 'Susan Krebople'),
	(12, 'Uncle Bumpkin'),
	(13, 'Dr. Frankenstein'),
	(14, 'Pumpkin Kim'),
	(15, 'Crazy Earl'),
	(16, 'Sane Earl'),
	(17, 'Apple Fritter'),
	(18, 'Joe Joe'),
	(19, 'Forest Gump'),
	(20, 'Grumpy the Dwarf')
;

SELECT * FROM bookAuthors;

INSERT INTO bookCopies (bookID, branchID, Number_of_Copies)
	VALUES
	-- Sharpstown Branch
	(1, 1, 3),
	(2, 1, 2),
	(5, 1, 5),
	(6, 1, 2),
	(7, 1, 2),
	(13, 1, 2),
	(15, 1, 4),
	(18, 1, 3),
	(20, 1, 2),
	-- Orlando Branch
	(1, 2, 2),
	(3, 2, 2),
	(4, 2, 4),
	(5, 2, 4),
	(8, 2, 2),
	(9, 2, 3),
	(11, 2, 6),
	(12, 2, 2),
	(14, 2, 2),
	(17, 2, 3),
	(19, 2, 2),
	(20, 2, 4),
	--Winter Park Branch
	(2, 3, 2),
	(3, 3, 2),
	(5, 3, 6),
	(9, 3, 3),
	(10, 3, 4),
	(11, 3, 3),
	(12, 3, 2),
	(13, 3, 2),
	(14, 3, 4),
	(16, 3, 5),
	(17, 3, 4),
	(18, 3, 5),
	(19, 3, 5),
	(20, 3, 5),
	-- Anaheim Branch
	(1, 4, 2),
	(2, 4, 5),
	(4, 4, 2),
	(5, 4, 2),
	(6, 4, 2),
	(8, 4, 2),
	(12, 4, 5),
	(14, 4, 5),
	(15, 4, 2),
	(16, 4, 3),
	(17, 4, 2),
	(18, 4, 2),
	(19, 4, 2),
	(20, 4, 2),
	-- Mulnomah Branch
	(1, 5, 2),
	(3, 5, 2),
	(5, 5, 5),
	(7, 5, 3),
	(9, 5, 2),
	(11, 5, 3),
	(13, 5, 4),
	(15, 5, 9),
	(17, 5, 2), 
	(19, 5, 3),
	-- Hellertown Branch
	(2, 6, 2),
	(4, 6, 2),
	(6, 6, 4),
	(8, 6, 3),
	(10, 6, 4),
	(12, 6, 2),
	(14, 6, 2),
	(16, 6, 4),
	(18, 6, 3),
	(20, 6, 4)
;

SELECT * FROM bookCopies;



INSERT INTO bookLoans (bookID, branchID, cardNo, dateOut, dateDue)
	VALUES
	-- Homer Simpson's books
	(1, 1, 100, '2023-02-01', '2023-03-01'),
	(3, 1, 100, '2023-02-01', '2023-03-01'),
	(11, 1, 100, '2023-02-01', '2023-03-01'),
	(14, 1, 100, '2023-02-01', '2023-03-01'),
	(19, 1, 100, '2023-02-01', '2023-03-01'),
	-- Steve Smith's books
	(1, 3, 101, '2023-01-01', '2023-02-01'),
	(2, 3, 101, '2023-01-01', '2023-02-01'),
	(5, 3, 101, '2023-01-01', '2023-02-01'),
	(17, 3, 101, '2023-01-01', '2023-02-01'),
	(20, 3, 101, '2023-01-01', '2023-02-01'),
	-- Jon Bellion's books
	(2, 2, 102, '2023-02-15', '2023-03-01'),
	(6, 2, 102, '2023-02-15', '2023-03-01'),
	(7, 2, 102, '2023-02-15', '2023-03-01'),
	(14, 2, 102, '2023-02-15', '2023-03-01'),
	(20, 2, 102, '2023-02-15', '2023-03-01'),
	-- Billy Kid's books
	(4, 5, 103, '2023-03-01', '2023-04-01'),
	(5, 5, 103, '2023-03-01', '2023-04-01'),
	(11, 5, 103, '2023-03-01', '2023-04-01'),
	(15, 5, 103, '2023-03-01', '2023-04-01'),
	(19, 5, 103, '2023-03-01', '2023-04-01'),
	-- John Jones's books
	(1, 1, 104, '2023-04-01', '2023-04-17'),
	(11, 1, 104, '2023-04-01', '2023-04-17'),
	(12, 1, 104, '2023-04-01', '2023-04-17'),
	(14, 1, 104, '2023-04-01', '2023-04-17'),
	(15, 1, 104, '2023-04-01', '2023-04-17'),
	-- Gavin Buzzard's books
	(2, 6, 105, '2023-03-01', '2023-04-01'),
	(6, 6, 105, '2023-03-01', '2023-04-01'),
	(9, 6, 105, '2023-03-01', '2023-04-01'),
	-- Crazy Guy's books

	-- Tony Tony's books
	(2, 3, 107, '2023-01-01', '2023-02-01'),
	(8, 3, 107, '2023-01-01', '2023-02-01'),
	(14, 3, 107, '2023-01-01', '2023-02-01'),
	(20, 3, 107, '2023-01-01', '2023-02-01')
;

SELECT * FROM bookLoans;

/*
By using the FULL OUTER JOIN on those three tables, you are able to see which BookID belongs in which branch, 
the card number of the borrower, the Publisher, the date the book was checked out and the date that it is due.
*/
SELECT * FROM ((bookLoans FULL OUTER JOIN borrower ON bookLoans.cardNo = 
borrower.cardNo) FULL OUTER JOIN books ON bookLoans.bookID = books.bookID)

-- Returns all book titles and the author's name
SELECT books.title, bookAuthors.authorName
FROM books
INNER JOIN bookAuthors ON books.bookID = bookAuthors.bookID


/*************************************
			  PROCEDURES
*************************************/

-- Stored procedure that will show how many copies of the book 'The Lost Tribe' are owned by the Sharpstown branch.
CREATE PROC dbo.uspselectLostTribefromSharpstownBranch
AS
SELECT bookCopies.Number_of_Copies, books.title, libraryBranch.branchName
FROM books
INNER JOIN bookCopies ON bookCopies.bookID = books.bookID
INNER JOIN libraryBranch ON libraryBranch.branchID = bookCopies.branchID
WHERE books.title = 'The Lost Tribe' AND libraryBranch.branchName = 'Sharpstown'
GO

EXEC [dbo].[uspselectLostTribefromSharpstownBranch]
GO

-- Shows how many copies of 'The Lost Tribe' are owned by each branch
CREATE PROC dbo.uspselectLostTribeFromAllBranches
AS
SELECT bookCopies.Number_of_Copies, books.title, libraryBranch.branchName
FROM books
INNER JOIN bookCopies ON bookCopies.bookID = books.bookID
INNER JOIN libraryBranch ON libraryBranch.branchID = bookCopies.branchID
WHERE books.title = 'The Lost Tribe'
GO

EXEC [dbo].[uspselectLostTribeFromAllBranches]
GO

-- Retrieves the names of all borrowers who do not have any books checked out
CREATE PROC dbo.uspretrieveBorrowersWithNoBookLoans
AS
SELECT borrower.borrowerName
FROM borrower
FULL JOIN bookLoans ON bookLoans.cardNo = borrower.cardNo
WHERE bookLoans.cardNo IS NULL
GO

EXEC [dbo].[uspretrieveBorrowersWithNoBookLoans]
GO