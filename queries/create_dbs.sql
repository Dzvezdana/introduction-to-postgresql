CREATE TABLE admin_vpres (
  admin_vpres_id SERIAL       NOT NULL UNIQUE,
  vice_pres_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (admin_vpres_id, vice_pres_name)
);

CREATE TABLE administration (
  id               SERIAL NOT NULL,
  admin_nr         INT    NOT NULL,
  pres_id          INT    NOT NULL,
  year_inaugurated INT    NULL,
  CONSTRAINT administration_fk FOREIGN KEY (id) REFERENCES admin_vpres (admin_vpres_id),
  PRIMARY KEY (id)
);

CREATE TABLE state (
  id           SERIAL       NOT NULL UNIQUE,
  name         VARCHAR(100) NOT NULL,
  admin_id     INT          NOT NULL REFERENCES administration (id),
  year_entered INT,
  CONSTRAINT bt_year_entered CHECK (((year_entered >= 1600) AND (year_entered <= 2100)))
);

ALTER TABLE ONLY administration
  ADD CONSTRAINT check_year_inaug CHECK (((year_inaugurated >= 1600) AND (year_inaugurated <= 2100)));

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
  CONSTRAINT check_death_age CHECK (((death_age > 20) OR (death_age IS NULL))),
  CONSTRAINT check_party CHECK (party = ANY (ARRAY ['DEMOCRATIC'::BPCHAR, 'REPUBLICAN'::BPCHAR, 'WHIG'::BPCHAR,
    'FEDERALIST'::BPCHAR, 'DEMO-REP'::BPCHAR])),
  CONSTRAINT check_party_v02 CHECK (birth_year <= 1800 OR party = ANY (ARRAY ['DEMOCRATIC'::BPCHAR, 'REPUBLICAN'::BPCHAR,
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
  ADD CONSTRAINT bt_election_year CHECK (((election_year >= 1600) AND (election_year <= 2100)));

ALTER TABLE ONLY election
  ADD CONSTRAINT above_zero_votes CHECK ((votes > 0));

ALTER TABLE election
  ADD CONSTRAINT winner_loser_opt CHECK (vinner_loser_indic = ANY (ARRAY ['W'::BPCHAR, 'L'::BPCHAR]));

ALTER TABLE pres_marriage
  ADD CONSTRAINT pres_spouse_age CHECK (NOT (marriage_year < 1800 AND spouse_age <= 21));

ALTER TABLE pres_marriage
  ADD CONSTRAINT pres_spouse_age CHECK (NOT (marriage_year >= 1800 AND spouse_age < 18));

CREATE INDEX iadmin ON administration USING btree (pres_id, year_inaugurated);
CREATE INDEX ipres ON president USING btree (party);
CREATE UNIQUE INDEX iadminnrpresid ON administration (admin_nr, pres_id);
