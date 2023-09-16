// load USA airports
:auto
  WITH 'project-5b6d1337-a0c4-4066-ae9d-ec665dd3a51b' as PROJECT_ID 
  WITH 'http://localhost:11001/' + PROJECT_ID + '/data/gg360/airports.csv' as URL
  LOAD CSV WITH HEADERS FROM URL as row
  CALL { 
    WITH row
    MERGE (airport:Airport {iata:row.IATA})
      ON CREATE SET
        airport.name = row.AIRPORT,
        airport.city = row.CITY,
        airport.state = row.STATE,
        airport.country = row.COUNTRY,
        airport.location = point({latitude: toFloat(row.LATITUDE), longitude: toFloat(row.LONGITUDE)})
  } IN TRANSACTIONS OF 10000 ROWS
  