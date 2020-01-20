-- Exercise 1
-- Find the names of all alive Democrat presidents who were in office for longer than 5 years.
SELECT *
FROM president
WHERE party = 'DEMOCRATIC' AND years_served > 5 AND death_age IS NULL;

-- Exercise 2
-- List the table named PRESIDENTS, ordered by years served in descending order.
SELECT *
FROM president
ORDER BY years_served DESC;

-- Exercise 3
-- List all facts available in the table named PRESIDENTS about the presidents whose last name is HARRISON.
SELECT *
FROM president
WHERE name LIKE 'HARRISON%';

-- Exercise
-- List all facts available in the table named PRESIDENTS about presidents who died at an age between 50 and 60 years.
SELECT *
FROM president
WHERE death_age BETWEEN 50 AND 60;


-- Exercise
-- List 10 democratic presidents
SELECT *
FROM president
WHERE party = 'DEMOCRATIC'
LIMIT 10;

-- Exercise
-- Find the president who died the youngest.
SELECT
  death_age,
  name
FROM president
WHERE death_age != 0
ORDER BY death_age;

-- List the president name, and his wife's name(s) as well as how old they were when they got married
SELECT
  pr.name,
  pm.spouse_name,
  pm.spouse_age,
  (pm.marriage_year - pr.birth_year) AS president_age
FROM president AS pr
  INNER JOIN pres_marriage AS pm
             ON pr.id = pm.pres_id;

-- Find the average age when presidents got married
SELECT
  AVG(pm.marriage_year - pr.birth_year)
FROM president pr
  INNER JOIN pres_marriage pm
             ON pr.id = pm.pres_id;



-- Exercise 3
-- List the names, birth years, and parties of all presidents. Order by parties and presidents' names, both in ascending alphabetical order.
SELECT
  name,
  birth_year,
  party
FROM president
ORDER BY name, party ASC;

--Exercise 2:
-- What's the average number of children for marriages after 1930?
SELECT
  AVG(nr_children) AS avg_nr_children
FROM pres_marriage
WHERE marriage_year > 1930;

--Exercise 3:
-- What's the average number of years presidents stayed in office?
SELECT
  AVG(years_served)
FROM president;

-- Exercise
-- Lets rename the vinner_loser_indic column to winner_loser.
ALTER TABLE election
  RENAME COLUMN vinner_loser_indic TO winner_loser;

--Exercise 4:
-- What was the minimum amount of votes winning presidents needed to be elected to office between 1800 and 1900?
SELECT
  MIN(votes)
FROM election
WHERE (election_year >= 1800 AND election_year < 1900)
  AND winner_loser = 'W';

--Exercise 5:
-- What's the total number of votes in 1808?
SELECT
  SUM(votes)
FROM election
WHERE election_year = 1808;

--Exercise 6:
-- How many election years were there between 1900 and 2000?
SELECT
  COUNT(DISTINCT election_year)
FROM election
WHERE (election_year >= 1900 AND election_year < 2000);

--Exercise 7:
-- How many unique losing candidates were there?
SELECT
  COUNT(DISTINCT candidate)
FROM election
WHERE winner_loser = 'L';

--Exercise 9:
-- Look at the birth states for presidents elected in office between 1875 and 1925.
-- How many unique states were there in total?
SELECT
  COUNT(DISTINCT name)
FROM state
WHERE year_entered >= 1875 AND year_entered <= 1925;

--Exercise 10:

SELECT
  count(DISTINCT pr.state_id_born)
FROM state st
  INNER JOIN president pr
             ON pr.state_id_born = st.id
WHERE pr.birth_year < 1900;

--Exercise 11:

SELECT
  count(*)
FROM pres_marriage pm
WHERE pm.marriage_year >= 1900;

-- For each state, count the number of presidents born in that state. List the state name together with this count,
-- and present in ascending order, and within the same count sort by ascending state name.
SELECT
  s.name,
  COUNT(*)
FROM president p
  INNER JOIN state s
             ON p.state_id_born = s.id
GROUP BY s.name
ORDER BY s.name DESC;

SELECT
  s.name,
  p.name
FROM state AS s
  INNER JOIN president p
             ON p.state_id_born = s.id;


--Second part

--Exercise 1:

SELECT
  sum(pm.nr_children)
FROM pres_marriage pm
WHERE (pm.marriage_year < 1900 OR pm.marriage_year >= 1950)
  AND pm.spouse_age >= 30;

--Exercise 2:
SELECT
  max(dif.max_birth - dif.min_birth)
FROM (
  SELECT
    max(pr.death_age) AS max_birth,
    min(pr.death_age) AS min_birth
  FROM president pr
  WHERE pr.years_served > 4
) AS dif;

--Exercise 3:

SELECT
  round(avg(pm.nr_children))
FROM pres_marriage pm
WHERE pm.spouse_age >= 20;

--Exercise 4:

SELECT
  sum(cr.summable)
FROM (
  SELECT
    1                          AS summable,
    ((45 - pm.spouse_age) / 5) AS sp_interval,
    pm.nr_children             AS child
  FROM pres_marriage pm
) AS cr
WHERE cr.sp_interval < cr.child;

--Exercise 5:

SELECT
  count(*)
FROM president pr
WHERE (pr.birth_year + pr.death_age >= 1950)
   OR (pr.death_age IS NULL AND pr.birth_year <= 1950);

--Exercise 6:

SELECT
  count(*)
FROM pres_marriage pm
WHERE pm.nr_children = 1;

--Exercise 7:
SELECT
  avg(cr.death_age)
FROM (
  SELECT DISTINCT
    pr.name      AS name,
    pr.death_age AS death_age
  FROM president pr
  WHERE pr.birth_year <= 1900 AND pr.death_age IS NOT NULL
) AS cr;

--Assignment 3:
--Exercise 1:
SELECT
  el.election_year,
  count(DISTINCT el.candidate),
  min(el.votes)
FROM election el
WHERE el.votes >= 20
GROUP BY el.election_year
HAVING count(DISTINCT el.candidate) >= 3;

--Exercise 2:
SELECT
  hob.pres_id               AS id,
  count(DISTINCT hob.hobby) AS nr_hobby
FROM pres_hobby hob
GROUP BY hob.pres_id
HAVING count(DISTINCT hob.hobby) >= 5;

--Exercise 10:
SELECT
  pr.name,
  el.election_year,
  el.votes
FROM state st
  INNER JOIN president pr
             ON pr.state_id_born = st.id
  INNER JOIN election el
             ON el.candidate = pr.name
WHERE st.year_entered > 1800
  AND el.election_year > 1900
  AND pr.party = 'DEMOCRATIC';

--Exercise 3:
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

--Exercise 6:
SELECT DISTINCT
  pr.name,
  pr.birth_year,
  el.election_year,
  el.votes,
  el.winner_loser
FROM president pr
  INNER JOIN election el
             ON el.candidate = pr.name
               AND el.election_year >= 1950 AND el.election_year <= 1980
               AND pr.party = 'REPUBLICAN'
ORDER BY el.election_year;