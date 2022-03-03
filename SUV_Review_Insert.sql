INSERT INTO "markets" (name) VALUES ('China');
INSERT INTO "markets" (name) VALUES ('United States');
INSERT INTO "markets" (name) VALUES ('Europe');
INSERT INTO "markets" (name) VALUES ('Japan');
INSERT INTO "markets" (name) VALUES ('India');
INSERT INTO "markets" (name) VALUES ('Brazil');
INSERT INTO "markets" (name) VALUES ('Russia');

SELECT * FROM "markets";

INSERT INTO "manufacturers" (name, country) VALUES ('Toyota','Japan');
INSERT INTO "manufacturers" (name, country) VALUES ('Jeep','United States');
INSERT INTO "manufacturers" (name, country) VALUES ('Land Rover','United Kingdom');

SELECT * FROM "manufacturers";

-- Toyota sells in all markets
INSERT INTO "sales_regions" (manufacturer_id,market_id)
SELECT man.manufacturer_id, mkt.market_id
FROM "manufacturers" man, "markets" mkt
WHERE man.name = 'Toyota';

-- Jeep sells in the united states, europe, and China
INSERT INTO "sales_regions" (manufacturer_id,market_id)
SELECT man.manufacturer_id, mkt.market_id
FROM "manufacturers" man, "markets" mkt
WHERE man.name = 'Jeep'
AND mkt.name IN ('United States','Europe','China');

-- Land Rover sells everywhere except Brazil and China
INSERT INTO "sales_regions" (manufacturer_id,market_id)
SELECT man.manufacturer_id, mkt.market_id
FROM "manufacturers" man, "markets" mkt
WHERE man.name = 'Land Rover'
AND mkt.name NOT IN ('Brazil','China');

SELECT * FROM "sales_regions";

-- The three most popular models from these three manufacturers
INSERT INTO "suvs" (manufacturer_id,model,wiki_page,start_year, end_year) VALUES (1,'4Runner','https://en.wikipedia.org/wiki/Toyota_4Runner',1984,2022);
INSERT INTO "suvs" (manufacturer_id,model,wiki_page,start_year, end_year) VALUES (2,'Wrangler','https://en.wikipedia.org/wiki/Jeep_Wrangler',1987,2022);
INSERT INTO "suvs" (manufacturer_id,model,wiki_page,start_year, end_year) VALUES (3,'Discovery','https://en.wikipedia.org/wiki/Land_Rover_Discovery',1985,2022);

SELECT * FROM "suvs";

-- only generate data for the last five years
WITH last_five_years AS (
	SELECT generate_series AS year FROM generate_series(2018,2022)
)
INSERT INTO "suv_years" (suv_id, year)
SELECT s.suv_id, lty.year
FROM "suvs" s, last_five_years lty;

SELECT * FROM "suv_years";

-- INSERT statements ----------------------------------------------------------------

-- Populate the Kelly Blue Book data --------------------------------------------

-- Toyota 4Runner
-- https://www.kbb.com/toyota/4runner
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2018 and s.model='4Runner' LIMIT 1),90,303,4.6);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2019 and s.model='4Runner' LIMIT 1),90,303,4.6);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2020 and s.model='4Runner' LIMIT 1),90,303,4.6);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2021 and s.model='4Runner' LIMIT 1),90,303,4.6);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2022 and s.model='4Runner' LIMIT 1),90,303,4.6);

-- Jeep Wrangler
-- https://www.kbb.com/jeep/wrangler
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2018 and s.model='Wrangler' LIMIT 1),88,871,4.5);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2019 and s.model='Wrangler' LIMIT 1),85,55,4.4);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2020 and s.model='Wrangler' LIMIT 1),85,55,4.4);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2021 and s.model='Wrangler' LIMIT 1),85,55,4.4);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2022 and s.model='Wrangler' LIMIT 1),85,55,4.4);

-- Land Rover Discovery
-- https://www.kbb.com/land-rover/discovery
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2018 and s.model='Discovery' LIMIT 1),83,10,4.4);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2019 and s.model='Discovery' LIMIT 1),83,10,4.4);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2020 and s.model='Discovery' LIMIT 1),83,10,4.4);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2021 and s.model='Discovery' LIMIT 1),83,10,4.4);
INSERT INTO "kbb_reviews" (suv_year_id, recomended, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2022 and s.model='Discovery' LIMIT 1),83,10,4.4);


-- Populate the Edmunds data --------------------------------------------

-- Toyota 4Runner
-- https://www.edmunds.com/toyota/4runner
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2018 and s.model='4Runner' LIMIT 1),73,4.2);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2019 and s.model='4Runner' LIMIT 1),52,4.3);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2020 and s.model='4Runner' LIMIT 1),40,4.3);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2021 and s.model='4Runner' LIMIT 1),34,3.9);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2022 and s.model='4Runner' LIMIT 1),5,4.8);

-- Jeep Wrangler
-- https://www.edmunds.com/jeep/wrangler
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2018 and s.model='Wrangler' LIMIT 1),61,3.2);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2019 and s.model='Wrangler' LIMIT 1),40,3.5);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2020 and s.model='Wrangler' LIMIT 1),14,4.2);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2021 and s.model='Wrangler' LIMIT 1),35,4.5);

-- Land Rover Discovery
-- https://www.edmunds.com/land-rover/discovery
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2018 and s.model='Discovery' LIMIT 1),12,3.3);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2019 and s.model='Discovery' LIMIT 1),6,3.0);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2020 and s.model='Discovery' LIMIT 1),2,4.5);
INSERT INTO "edmunds_reviews" (suv_year_id, reviews, score) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2021 and s.model='Discovery' LIMIT 1),1,3.0);

-- Populate the Cars.com data --------------------------------------------

-- Toyota 4Runner
-- https://www.cars.com/toyota/4runner
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2018 and s.model='4Runner' LIMIT 1),252,4.8,45160);
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2019 and s.model='4Runner' LIMIT 1),189,4.8,47400);
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2020 and s.model='4Runner' LIMIT 1),84,4.8,49865);
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2021 and s.model='4Runner' LIMIT 1),41,4.9,50745);

-- Jeep Wrangler
-- https://www.cars.com/jeep/wrangler
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2018 and s.model='Wrangler' LIMIT 1),62,4.8,37945);
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2019 and s.model='Wrangler' LIMIT 1),49,4.8,38045);
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2020 and s.model='Wrangler' LIMIT 1),55,4.7,38695);
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2021 and s.model='Wrangler' LIMIT 1),30,4.9,51695);

-- Land Rover Discovery
-- https://www.cars.com/research/land_rover-discovery-20xx/
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2018 and s.model='Discovery' LIMIT 1),23,3.4,65490);
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2019 and s.model='Discovery' LIMIT 1),3,3.7,67200);
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2020 and s.model='Discovery' LIMIT 1),3,4.9,67200);
INSERT INTO "cars_dotcom_reviews" (suv_year_id, reviews, score, cost_new) VALUES ((SELECT sy.id FROM "suv_years" sy JOIN "suvs" s ON sy.suv_id=s.suv_id WHERE sy.year=2021 and s.model='Discovery' LIMIT 1),2,5.0,68900);