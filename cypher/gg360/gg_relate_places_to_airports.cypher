// connect airports if any flight route exists between them
:auto
MATCH (place:Place)
WHERE place.population > 10000
CALL {
  WITH place
  MATCH (airport:Airport)
  WITH place, airport, (point.distance(place.location, airport.location) / 1000) as kilometers
  WHERE kilometers < 100
  MERGE (place)-[:NEARBY_AIRPORT {kilometers: kilometers}]->(airport)
} IN TRANSACTIONS OF 1000 ROWS