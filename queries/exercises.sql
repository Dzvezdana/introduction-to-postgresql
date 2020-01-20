-- Exercise 1
-- Take a look at the ELECTION table.
-- Lets rename the vinner_loser_indic column to winner_loser.
ALTER TABLE election
  RENAME COLUMN vinner_loser_indic TO winner_loser;

-- Exercise 2
-- Find the names of all alive Democrat presidents who were in office for longer than 5 years.
SELECT *
FROM president AS pr
WHERE pr.party = 'DEMOCRATIC' AND pr.years_served > 5 AND pr.death_age IS NULL;

-- Exercise 3
-- List the PRESIDENTS table, ordered by years served in descending order.
SELECT *
FROM president AS pr
ORDER BY pr.years_served DESC;

-- Exercise 4
-- List all available facts in the PRESIDENTS table about the presidents whose last name is HARRISON.
SELECT *
FROM president AS pr
WHERE pr.name LIKE 'HARRISON%';

-- Exercise 5
-- List all facts available in the table named PRESIDENTS about presidents who died at an age between 50 and 60 years.
SELECT *
FROM president AS pr
WHERE pr.death_age BETWEEN 50 AND 60;

-- Exercise 6
-- List 10 democratic presidents.
SELECT *
FROM president AS pr
WHERE pr.party = 'DEMOCRATIC'
LIMIT 10;

-- Exercise 7
-- Find the president who died the youngest.
SELECT
  pr.name      AS name,
  pr.death_age AS death_age
FROM president AS pr
WHERE pr.death_age != 0
ORDER BY pr.death_age;

-- Exercise 8
-- List the president name, and his wife's name(s) as well as how old they were when they got married.
SELECT
  pr.name                            AS name,
  pm.spouse_name                     AS spouse_name,
  pm.spouse_age                      AS spouse_age,
  (pm.marriage_year - pr.birth_year) AS president_age
FROM president AS pr
  INNER JOIN pres_marriage AS pm
             ON pr.id = pm.pres_id;

-- Exercise 9
-- Find the average age when presidents got married.
SELECT
  AVG(pm.marriage_year - pr.birth_year) AS marrige_age
FROM president pr
  INNER JOIN pres_marriage pm
             ON pr.id = pm.pres_id;

-- Exercise 10
-- List the names, birth years, and parties of all presidents. Order by parties and presidents' names, both in ascending alphabetical order.
SELECT
  pr.name       AS name,
  pr.birth_year AS birth_year,
  pr.party      AS party
FROM president AS pr
ORDER BY name, party ASC;

--Exercise 11
-- What's the average number of children for marriages after 1930?
SELECT
  AVG(pm.nr_children) AS avg_nr_children
FROM pres_marriage AS pm
WHERE pm.marriage_year > 1930;

--Exercise 12
-- What's the average number of years presidents stayed in office?
SELECT
  AVG(pr.years_served) AS average_severed_years
FROM president AS pr;

--Exercise 13
-- What was the minimum amount of votes winning presidents needed to be elected to office between 1800 and 1900?
SELECT
  MIN(e.votes) AS min_votes
FROM election AS e
WHERE (e.election_year >= 1800 AND e.election_year < 1900)
  AND e.winner_loser = 'W';

--Exercise 14
-- What's the total number of votes in 1808?
SELECT
  SUM(e.votes) AS total_votes
FROM election AS e
WHERE e.election_year = 1808;

--Exercise 15
-- How many distinct election years were there between 1900 and 2000?
SELECT
  COUNT(DISTINCT election_year) AS total_distinct_election_years
FROM election
WHERE (election_year >= 1900 AND election_year < 2000);

--Exercise 16
-- How many unique losing candidates were there?
SELECT
  COUNT(DISTINCT candidate) AS total_distinct_candidates
FROM election
WHERE winner_loser = 'L';

-- Exercise 17
-- For each state, count the number of presidents born in that state. List the state name together with this count.
-- List the results sorted by descending state name.
SELECT
  s.name,
  COUNT(*)
FROM president p
  INNER JOIN state s
             ON p.state_id_born = s.id
GROUP BY s.name
ORDER BY s.name DESC;

-- Exercise 18
-- What is the rounded average number of children presidents had if their spouse was older than 30?
SELECT
  round(avg(pm.nr_children))
FROM pres_marriage pm
WHERE pm.spouse_age >= 30;


-- Exercise 19
-- Find the presidents that had more than 5 distinct hobbies. Display the president name, and the number of hobbies.
SELECT
  pr.name                   AS name,
  count(DISTINCT hob.hobby) AS nr_hobby
FROM pres_hobby hob
  INNER JOIN president pr
             ON pr.id = hob.pres_id
GROUP BY pr.name
HAVING count(DISTINCT hob.hobby) >= 5;


-- Exercise 20
-- Find all republican presidents that married after 1900 and had 2 or more children.
-- List the president name, his wife's name, and the number of children.
SELECT
  pr.name,
  pm.spouse_name,
  pm.nr_children
FROM president pr
  INNER JOIN pres_marriage pm
             ON pm.pres_id = pr.id
               AND pm.marriage_year > 1900
               AND pr.party = 'REPUBLICAN'
               AND pm.nr_children >= 2;

SELECT *,
       rank() OVER (PARTITION BY president.party ORDER BY president.id)
FROM president;

SELECT
  name,
  death_age,
  avg(death_age) OVER (PARTITION BY party)         AS avg_deathage_party,
  avg(death_age) OVER (PARTITION BY state_id_born) AS avg_deathage_state
FROM president
WHERE death_age IS NOT NULL
GROUP BY (name, death_age, party, state_id_born);

SELECT
  president.name,
  president.birth_year,
  s.name,
  rank() OVER (PARTITION BY president.birth_year ORDER BY president.id)
FROM president
  INNER JOIN state s
             ON president.state_id_born = s.id
WHERE birth_year > 1850;

-- Write a procedure that displays the total number of children for each president and stored the result in new temporal table.
-- Write a procedure that displays the names of vice presidents that also became president and store the result in new temporal table.