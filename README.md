# SUV Reviews
**SQL/Python Portfolio Project Report**

By Jacob Kluft


### Description ###
The Sport Utility Vehicle (SUV) Reviews database is designed to help consumers to determine what kind of SUV to purchase based upon user reviews submitted to the Kelly Blue Book, Edmunds, and Cars.com websites.  Each SUV is manufactured by a manufacturer and each manufacturer sells within one to many markets in the world.  Each different model of SUV was manufactured for a number of years between the start_year and end_year fields in the SUVs table.  The KBB_Reviews, Edmunds_Reviews, and Cars_Dotcom_Reviews tables all have a suv_year_id from the suv_years table that makes it possible to compare a SUV of a given year with reviews from all three review tables.  All of the review tables have a score field from 0-5 and num_reviews field that contains the number of people who submitted reviews that created the score field.  Kelly Blue Book has the recomended field that is the percentage of reviewers who would recomend this vehicle to a friend.  The Cars.com review table has the cost_new field that contains the original cost of a fully loaded suv of this type.  The SUV Review database is connected to several API's for the SUVs and KBB_Reviews tables to query and edit some of the data stored within this project.

### API Reference Table ###
| Path                          | Method | Parameters                                              | Name               | Description                                                      |
|-------------------------------|--------|---------------------------------------------------------|--------------------|------------------------------------------------------------------|
| http://localhost:5000/suv     | GET    |                                                         | get_all_suvs       | Returns all rows from the SUVs table                             |
| http://localhost:5000/suv/:id | GET    |                                                         | get_one_suv        | Returns one record from the SUVs table                           |
| http://localhost:5000/kbb/:id | GET    |                                                         | get_kbb_reviews    | Returns all Kelly Blue Book reviews for all years of a given SUV |
| http://localhost:5000/suv     | POST   | Model, start_year, end_year, manufacturer_id, wiki_page | add_suv            | Inserts one record into the SUVs table                           |
| http://localhost:5000/kbb     | POST   | suv_year_id, num_reviews, score, recomended             | add_kbb_review     | Inserts a new record into the KBB_Reviews table                  |
| http://localhost:5000/kbb/:id | PUT    | num_reviews, score, recomended                          | update_kbb_reviews | Update a record in the kbb_reviews_table                         |
| http://localhost:5000/kbb/:id | DELETE |                                                         | delete_kbb_review  | Deletes one record in the kbb_reviews_table                      |

Steps to run:
1. Create the virtual environment by running: "python -m venv venv" in the 3-DevOps folder
2. Activate the virtual environment by running ". venv/scripts/activate" from the 3-DevOps folder
3. Install the python packages by running the following code:
	python -m pip install --upgrade pip==21.1.2
	python -m pip install -r requirements.txt
4. Get the Docker containers up by running the following command: "docker compose up -d"
5. pgAdmin should be up and running at http://localhost:5433
6. create the suv_reviews database in pgAdmin or run "docker exec -i pg_container psql -c 'CREATE DATABASE suv_reviews;'"
7. Open the query tool in pgAdmin on the suv_reviews database, copy and paste the contents of SUV_Reviews_Create.sql into the query window and run it to create the tables and constraints
8. Open a new query tool window in PgAdmin and run the contents of SUV_Reviews_Insert.sql to populate the database
	Note: the contents of the database can also be found in the suv_reviews_dump.sql file
9. Open Insomnia and import the final_project/flask/Insomnia.json file to import the SUV Reviews API.