USE db_zooTest
GO

-- returns all data in the habitat table. --
SELECT * FROM tbl_habitat;

-- retrieves all names from species_name of the tbl_species table that have a species_order value of 3 --
SELECT species_name FROM tbl_species WHERE species_order = 3;

-- Retrieves only the types from the nutrition_type column of the table tbl_nutrition that have a nutrition_cost of 600 or less --
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600;

-- Retrieves all species_names from the nutrition table that have an id between 2202 and 2206 --
SELECT 
species_name 
FROM tbl_species 
INNER JOIN tbl_nutrition ON tbl_nutrition.nutrition_id = tbl_species.species_nutrition
WHERE nutrition_id BETWEEN 2202 AND 2206;

-- Retrieves all names from the species_name column in the species table and their corresponding nutrition_type from the nutrition table --
SELECT
species_name AS [Species Name:],
nutrition_type AS [Nutrition Type:]
FROM tbl_species
INNER JOIN tbl_nutrition ON nutrition_id = species_nutrition

SELECT * FROM tbl_specialist
SELECT * FROM tbl_species
SELECT * FROM tbl_care

-- Retrieves specialists first name, last name, and contact number, from people that provide care to penguins -- 
SELECT specialist_fname, specialist_lname, specialist_contact 
FROM tbl_specialist
INNER JOIN tbl_care ON care_specialist = specialist_id
INNER JOIN tbl_species ON species_care = care_id
WHERE tbl_species.species_name ='penguin';
