// load USA geonames for places
:auto
  WITH 'project-5b6d1337-a0c4-4066-ae9d-ec665dd3a51b' as PROJECT_ID 
  WITH 'http://localhost:11001/' + PROJECT_ID + '/data/gg360/geonames/us_geonames.csv' as URL
  LOAD CSV WITH HEADERS FROM URL as row
  WITH row
  WHERE row.feature_class = "P"
  CALL { 
    WITH row
    MERGE (place:Place {geonameid:row.geonameid})
      ON CREATE SET
        place.elevation = toInteger(row.elevation),
        place.timezone = row.timezone,
        place.location = point({latitude:toFloat(row.latitude), longitude:toFloat(row.longitude)}),
        place.population = toInteger(row.population),
        place.alternatenames = split(row.alternatenames, ','),
        place.country_code = row.country_code,
        place.name = row.name,
        place.admin1 = row.admin1,
        place.admin2 = row.admin2,
        place.admin3 = row.admin3,
        place.admin4 = row.admin4,
        place.asciiname = row.asciiname,
        place.feature_class = row.feature_class,
        place.feature_code = row.feature_code
  } IN TRANSACTIONS OF 10000 ROWS
  