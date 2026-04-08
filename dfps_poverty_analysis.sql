-- Creating tables
CREATE TABLE dfps_data(county VARCHAR (100), year INT, 
confirmed_victims INT);
CREATE TABLE saipe_data(county VARCHAR (100), year INT, 
poverty_rate FLOAT);

-- Join Query
CREATE TABLE dfps_poverty_final AS
SELECT d.county, d.year, d.confirmed_victims, s.poverty_rate
FROM dfps_data d 
JOIN saipe_data s 
ON d.county=s.county
AND d.year= s.year;

-- Analysis Queries
SELECT county, SUM(confirmed_victims) as total_victims
FROM dfps_poverty_final
GROUP BY county;
