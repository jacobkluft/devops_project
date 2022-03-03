--CREATE DATABASE suv_reviews;

-- Table Create Statements

CREATE TABLE SUVs
(
	suv_id 		SERIAL PRIMARY KEY,
	model		VARCHAR(32) NOT NULL,
	wiki_page 	VARCHAR(128),
	start_year	INT NOT NULL,
	end_year	INT NOT NULL,
	manufacturer_id INT NOT NULL
);

CREATE TABLE Manufacturers
(
	manufacturer_id		SERIAL PRIMARY KEY,
	name				VARCHAR(32) NOT NULL,
	country				VARCHAR(32) NOT NULL
);

CREATE TABLE Markets
(
	market_id	SERIAL PRIMARY KEY,
	name		VARCHAR(32) NOT NULL
);

CREATE TABLE KBB_Reviews
(
	KBB_Review_id 	SERIAL PRIMARY KEY,
	suv_year_id		INT NOT NULL,
	recomended		INT NOT NULL,
	reviews			INT NOT NULL,
	score			NUMERIC(3,2) NOT NULL
);

CREATE TABLE Edmunds_Reviews
(
	edmunds_review_id	SERIAL PRIMARY KEY,
	suv_year_id			INT NOT NULL,
	reviews				INT NOT NULL,
	score				NUMERIC(3,2) NOT NULL
);

CREATE TABLE Cars_Dotcom_Reviews
(
	cars_dotcom_review_id	SERIAL PRIMARY KEY,
	suv_year_id		INT NOT NULL,
	reviews			INT NOT NULL,
	score			NUMERIC(3,2) NOT NULL,
	cost_new		NUMERIC(6,0)
);

CREATE TABLE Sales_Regions
(
	id	SERIAL PRIMARY KEY,
	manufacturer_id	INT NOT NULL,
	market_id INT NOT NULL
);

CREATE TABLE SUV_Years 
(
	id SERIAL UNIQUE,
	suv_id	INT NOT NULL,
	year	INT NOT NULL,
	PRIMARY KEY(id, year) 
);

-- Add keys
ALTER TABLE SUVs ADD CONSTRAINT fk_SUVs_Manufacturers FOREIGN KEY(manufacturer_id) REFERENCES Manufacturers(manufacturer_id);
ALTER TABLE KBB_Reviews ADD CONSTRAINT fk_kbb_reviews_suv_years FOREIGN KEY(suv_year_id) REFERENCES SUV_Years(id);
ALTER TABLE Edmunds_Reviews ADD CONSTRAINT fk_edmunds_reviews_suv_years FOREIGN KEY(suv_year_id) REFERENCES SUV_Years(id);
ALTER TABLE Cars_Dotcom_Reviews ADD CONSTRAINT fk_edmunds_reviews_suv_years FOREIGN KEY(suv_year_id) REFERENCES SUV_Years(id);
ALTER TABLE Sales_Regions ADD CONSTRAINT fk_Sales_Regions_Manufacturers FOREIGN KEY(manufacturer_id) REFERENCES Manufacturers(manufacturer_id);
ALTER TABLE Sales_Regions ADD CONSTRAINT fk_Sales_Regions_Markets FOREIGN KEY(market_id) REFERENCES Markets(market_id);
ALTER TABLE SUV_Years ADD CONSTRAINT fk_SUV_Years_SUVs FOREIGN KEY(suv_id) REFERENCES SUVs(suv_id);