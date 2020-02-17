-- Exercise 1
-- How many presidents are there in the list?
SELECT DISTINCT COUNT(name)
FROM president;
--44

-- Exercise 2
-- Take a look at the ELECTION table.
-- Lets rename the vinner_loser_indic column to winner_loser.
ALTER TABLE election
    RENAME vinner_loser_indic TO winner_loser;
--done

-- Exercise 3
-- Find the names of all alive Democrat presidents who were in office for longer than 5 years.
SELECT name
FROM president
WHERE years_served > 5
  AND death_age IS NULL;

-- Exercise 4
-- List the PRESIDENTS table, ordered by years served in descending order.
SELECT *
FROM president
ORDER BY years_served DESC;

-- Exercise 5
-- List all available facts in the PRESIDENTS table about the presidents whose last name is HARRISON.
SELECT *
FROM president
WHERE name LIKE '%HARRISON%';

-- Exercise 6
-- List all facts available in the table named PRESIDENTS about presidents who died at an age between 50 and 60 years.
SELECT *
FROM president
WHERE death_age BETWEEN 50 AND 60;

-- Exercise 7
-- List 10 democratic presidents.
SELECT name
FROM president
WHERE party LIKE '%DEMOCRATIC%';

-- Exercise 8
-- Find the president who died the youngest.
SELECT *
FROM president
ORDER BY death_age
LIMIT 1;

-- Exercise 9
-- List the president name, and his wife's name(s) as well as how old they were when they got married.
SELECT president.id                as president_id,
       president.name              as president_name,
       pres_marriage.spouse_name   as spouse_name,
       pres_marriage.marriage_year as marriage_year
FROM president
         INNER JOIN pres_marriage ON president.id = pres_marriage.pres_id;

-- Exercise 10
-- Find the average age when presidents got married.
SELECT AVG(pres_marriage.marriage_year - president.birth_year) as average_married_age
FROM president
         INNER JOIN pres_marriage ON president.id = pres_marriage.pres_id;
--31.9607843137254902;

-- Exercise 11
-- List the names, birth years, and parties of all presidents. Order by parties and presidents' names, both in ascending alphabetical order.
SELECT name, birth_year, party
FROM president
ORDER BY party, name ASC;

--Exercise 12
-- What's the average number of children for marriages after 1930?
SELECT AVG(nr_children)
FROM pres_marriage
WHERE marriage_year > 1930;
--2.5

--Exercise 13
-- What's the average number of years presidents stayed in office?
SELECT AVG(years_served)
FROM president;
--4.9545454545454545

--Exercise 14
-- What was the minimum amount of votes winning presidents needed to be elected to office between 1800 and 1900?
SELECT MIN(votes)
FROM election
WHERE winner_loser = 'W';
--69

--Exercise 15
-- What's the total number of votes in 1808?
SELECT SUM(votes)
FROM election
WHERE election_year = 1808;

--Exercise 16
-- How many distinct election years were there between 1900 and 2000?
SELECT COUNT(DISTINCT election_year)
FROM election;
--57

--Exercise 17
-- How many distinct losing candidates were there?
SELECT COUNT(DISTINCT candidate)
FROM election
WHERE winner_loser = 'L';
--85

--Exercise 18
-- List the names of the candidates who lost more than one time?
-- List the results sorted by descending number of lose.
-- SELECT SUM(A.number_of_loss) AS losses, A.candidate
-- from (
--          SELECT COUNT(*) as number_of_loss, B.election_year, B.candidate
--          FROM election B
--          WHERE B.winner_loser = 'L'
--          GROUP BY B.election_year, B.candidate --election year is not needed as no repeated rows for elected year and votes
--      ) A
-- GROUP BY 2
-- HAVING SUM(A.number_of_loss) > 1 --used only after the table is transformed
-- ORDER BY 1 DESC;

SELECT candidate,
       winner_loser,
       COUNT(*)
FROM election
WHERE winner_loser = 'L'
GROUP BY candidate, winner_loser
HAVING COUNT(*) > 1
ORDER BY 3 DESC;


-- Exercise 19
-- For each state, count the number of presidents born in that state. List the state name together with this count.
-- List the results sorted by descending number of presidents.
SELECT COUNT(*) as number_of_presidents_born, state.name
FROM president
         INNER JOIN state ON president.state_id_born = state.id
GROUP BY state.name
ORDER BY number_of_presidents_born DESC;

-- Exercise 20
-- What is the rounded average number of children presidents had if their spouse was older than 30?
SELECT round(AVG(nr_children))
FROM pres_marriage
WHERE spouse_age > 30;
--1

-- Exercise 21
-- Find the presidents that had more than 5 hobbies. Display the president name, and the number of hobbies.
SELECT president.name  as name,
       COUNT(pr.hobby) as hobby
FROM president
         INNER JOIN pres_hobby pr ON president.id = pr.pres_id
GROUP BY name
HAVING COUNT(pr.hobby) >= 5;

-- Exercise 22
-- Find all republican presidents that married after 1900 and had 2 or more children.
-- List the president name, his wife's name, and the number of children.
SELECT *
FROM pres_marriage;

-- Exercise 23
-- For each state find the average rounded number of votes winning candidates got.
-- List the state, and the average rounded number of votes.
-- You should get one value per state.


-- Exercise 24
-- Using window function find the average number of votes winning candidates got per state.
-- List the states, the average rounded number of votes, the president name and vote.
-- You should get multiple values per state.

