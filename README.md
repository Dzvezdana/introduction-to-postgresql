# Introduction to PostgreSQL

This directory contains a set of basic examples for new PostgreSQL users. It contains 2 parts:

1. [queries](https://github.com/Dzvezdana/introduction-to-postgresql/blob/master/queries) contains basic SQL exercises.
2. [python-connection](https://github.com/Dzvezdana/introduction-to-postgresql/blob/master/python-connection) contains
example how to connect to PostgreSQL and execute queries using Psycopg2.

You can find the documentation here:

* [PostgreSQL](https://www.postgresql.org/docs/9.4/index.html)
* [Psycopg2](http://initd.org/psycopg/docs/)

Clone the repository and create a new *exercises* branch. Let's start with part one:

* First, familiarise yourself with the [data](#US-President-Database) we're going to use.
* Then execute the queries in [create_tables.sql](https://github.com/Dzvezdana/introduction-to-postgresql/blob/master/queries/create_tables.sql). 
This will create the tables we need.
* Now lets insert some data into the tables. Execute the queries in [insert_data.sql](https://github.com/Dzvezdana/introduction-to-postgresql/blob/master/queries/insert_data.sql).
* Finally, you can start working on the [exercises.sql](https://github.com/Dzvezdana/introduction-to-postgresql/blob/master/queries/exercises.sql).

## US President Database
In this exercise we will work with the **US Presidents Database**, which contains 5 tables. 

**Note**: All information in RDBMs is in the form of tables (relation). All tables are two-dimensional, having a specific 
number of columns, and a variable number of unordered rows. 

The `PRESIDENTS` table contains the following information:

* `id`: primary key
* `name`: the president's name
* `birth_year`: the president’s birth year
* `years_served`: number of years in office
* `death_age`: his death age (if applicable)
* `party`: the party of the president at the time of first inauguration
* `state_id_born`: the state where the president was born.
   

The `STATES` table contains the following information:

* `name`: state name
* `year_entered`: first year of service

The `ELECTION` table contains the following information:

* `election_year`: election year
* `candidate`: candidate name
* `votes`: number of votes
* `vinner_loser_indic`: Won or Lost the elections

The `PRE_HOBBY` table contains the following information:

* `pres_id`: president id
* `hobby`: hobby

The `PRES_MARRIAGE` table contains the following information:

* `pres_id`: president id
* `spouse_name`: name before marriage
* `spouse_age`: age when getting married
* `nr_children`: number of children
* `marriage_year`: marriage 


#### Useful Intellij shortcuts:
    
* Execute queries: `Command` + `Enter`.
* Format queries: `Option` + `Command` + `L`.

