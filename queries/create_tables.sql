CREATE TABLE state (
  id           SERIAL       NOT NULL UNIQUE,
  name         VARCHAR(100) NOT NULL,
  year_entered INT,
  CONSTRAINT bt_year_entered CHECK (((year_entered >= 1600) AND (year_entered <= 2100)))
);

CREATE TABLE election (
  election_year      INT          NOT NULL,
  candidate          VARCHAR(100) NOT NULL,
  votes              INT          NOT NULL,
  vinner_loser_indic CHAR(1)      NOT NULL,
  PRIMARY KEY (election_year, candidate)
);

CREATE TABLE president (
  id            SERIAL       NOT NULL,
  name          VARCHAR(100) NOT NULL,
  birth_year    INT          NOT NULL,
  years_served  INT          NOT NULL,
  death_age     INT          NULL,
  party         VARCHAR(10)  NOT NULL,
  state_id_born INT          NOT NULL REFERENCES state (id),
  CONSTRAINT check_birth_year CHECK (((birth_year >= 1600) AND (birth_year <= 2100))),
  CONSTRAINT check_party CHECK (party = ANY (ARRAY ['DEMOCRATIC'::BPCHAR, 'REPUBLICAN'::BPCHAR, 'WHIG'::BPCHAR,
    'FEDERALIST'::BPCHAR, 'DEMO-REP'::BPCHAR])),
  PRIMARY KEY (id)
);

CREATE TABLE pres_hobby (
  pres_id INT          NOT NULL,
  hobby   VARCHAR(100) NOT NULL,
  PRIMARY KEY (pres_id, hobby)
);

CREATE TABLE pres_marriage (
  pres_id       INT          NOT NULL REFERENCES president (id),
  spouse_name   VARCHAR(100) NOT NULL,
  spouse_age    INT          NOT NULL,
  nr_children   INT,
  marriage_year INT,
  CONSTRAINT check_marriage_year CHECK (((marriage_year >= 1600) AND (marriage_year <= 2100))),
  CONSTRAINT check_spouse_age CHECK ((spouse_age > 15)),
  PRIMARY KEY (pres_id, spouse_name)
);

ALTER TABLE ONLY election
  ADD CONSTRAINT above_zero_votes CHECK ((votes > 0));

ALTER TABLE election
  ADD CONSTRAINT winner_loser_opt CHECK (vinner_loser_indic = ANY (ARRAY ['W'::BPCHAR, 'L'::BPCHAR]));

CREATE INDEX ipres ON president USING btree (party);
