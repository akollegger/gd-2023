// For each pair of stops with the same name
// create a "Place" node and connect both stops to it
MATCH (stop:Stop)
MERGE (place:Place {name:stop.name})
  ON CREATE SET place.location = stop.location
MERGE (stop)-[:AT]->(place)
RETURN count(place)