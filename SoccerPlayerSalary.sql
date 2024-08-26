CREATE TABLE Players(
	Jersey_Number INT PRIMARY KEY,
	First_Name VARCHAR(25),
	Last_Name VARCHAR(25),
	Nationality VARCHAR(50),
	Position CHAR(5),
	Date_of_Birth DATE,
	Gross_PerWeek MONEY,
	Gross_PerYear MONEY,

);

INSERT INTO Players (Jersey_Number, First_Name, Last_Name, Nationality, Position, Date_of_Birth, Gross_PerWeek, Gross_PerYear)
VALUES (3, 'Alejandro', 'Balde', 'Spain', 'LB', '2003-10-18', 34467, 1792295),
	(4, 'Ronald', 'Araujo', 'Uruguay', 'CB', '1999-07-03', 144473, 7512616),
	(15, 'Andreas', 'Christensen', 'Denmark', 'CB', '1996-10-04', 185751, 9659077),
	(5, 'Inigo', 'Martinez', 'Spain', 'CB', '1991-05-17', 193594, 10066905),
	(2, 'Joao', 'Cancelo', 'Portugal', 'RB', '1994-05-27', 257988, 13415385),
	(23, 'Jules', 'Kounde', 'France', 'CB', '1998-11-12', 279659, 14542477),
	(17, 'Marcos', 'Alonso', 'Spain', 'LB', '1990-12-28', 128994, 6707692),
	(20, 'Sergi', 'Roberto', 'Spain', 'RB', '1992-02-07', 103195, 5366154),
	(21, 'Frenkie', 'De Jong', 'Netherlands', 'CM', '1997-05-12', 773965, 40246155),
	(6, 'Pablo', 'Gavi', 'Spain', 'CM', '2004-08-05', 140346, 7297969),
	(22, 'Ilkay', 'Gundogan', 'Germany', 'CM', '1990-10-24', 386982, 20123078),
	(18, 'Oriol', 'Romeu', 'Spain', 'CDM', '1991-09-24', 72237, 3756308),
	(8, 'Pedri', 'Gonzalez', 'Spain', 'CM', '2002-11-25', 193594, 10066905),
	(7, 'Ferran', 'Torres', 'Spain', 'RW', '2000-02-29', 206391, 10732308),
	(14, 'Joao', 'Felix', 'Portugal', 'CF', '1999-11-10', 8256, 429292),
	(9, 'Robert', 'Lewandowski', 'Poland', 'ST', '1988-08-21', 558096, 29063090),
	(11, 'Raphinha', 'Belloli', 'Brazil', 'RW', '1996-12-14', 257988, 13415385),
	(19, 'Vitor', 'Roque', 'Brazil', 'ST', '2005-02-28',  72237, 3756308),
	(27, 'Lamine', 'Yamal', 'Spain', 'RW', '2007-07-13',  34467, 1792295),
	(33, 'Pau', 'Cubarsi', 'Spain', 'CB', '2007-01-22', 82556, 4292923),
	(16, 'Fermin', 'Lopez', 'Spain', 'CM', '2003-11-05', 13003, 676135),
	(26, 'Ander', 'Astralaga', 'Spain', 'GK', '2004-03-03', 4128, 214646),
	(1, 'Marc-Andre', 'ter Stegen', 'Germany', 'GK', '1992-04-30', 130026, 6761354),
	(13, 'Inaki', 'Pena', 'Spain', 'GK', '1999-03-02', 67077, 3488000);


--Which players are the Top 5 earners per week from Spain?--
SELECT TOP 5 First_Name,
		Last_Name,
		Nationality,
		Gross_PerWeek
FROM Players
WHERE Nationality = 'Spain'
ORDER BY Gross_PerWeek DESC;


--Order the positions based upon earners who have the most average salary per week--
SELECT Position,
		AVG(Gross_PerWeek) AS 'Average Gross Salary Per Week'
FROM Players
GROUP BY Position
ORDER BY AVG(Gross_PerWeek) DESC


--Which Nationality has the most current defenders on the team?--
SELECT Nationality,
		COUNT(*) AS '# of Defenders'
FROM Players
WHERE Position = 'CB' OR Position = 'LB' OR Position = 'RB'
GROUP BY Nationality
ORDER BY COUNT(*) DESC;


--Which players earn a gross salary per year of 10000000 and are older than 25 years?--
SELECT First_Name,
		Last_Name,
		Gross_PerYear AS 'Gross Salary Per Year'
FROM Players
WHERE Gross_PerYear > 10000000
	AND DATEDIFF(year, Date_of_Birth, '2024-05-28') > 25
ORDER BY Gross_PerYear DESC


--Who is the oldest and youngest player on the team?--
SELECT  TOP 1 First_Name,
				Last_Name,
		MAX(DATEDIFF(year, Date_of_Birth, '2024-05-28')) AS 'Oldest'
FROM Players
GROUP BY First_Name,
			Last_Name;

SELECT  TOP 1 First_Name,
				Last_Name,
		MIN(DATEDIFF(year, Date_of_Birth, '2024-05-28')) AS 'Youngest'
FROM Players
GROUP BY First_Name,
			Last_Name
ORDER BY MIN(DATEDIFF(year, Date_of_Birth, '2024-05-28')) ASC;


