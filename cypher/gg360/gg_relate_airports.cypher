// connect airports if any flight route exists between them
:auto
LOAD CSV WITH HEADERS FROM "http://localhost:11001/project-5b6d1337-a0c4-4066-ae9d-ec665dd3a51b/data/gg360/routes.csv" as row
WITH row
CALL {
  WITH row
  MATCH (source:Airport),(destination:Airport)
  WHERE source.iata = row.source_airport
    AND destination.iata = row.destination_airport
  MERGE (source)-[:FLIGHT]-(destination)
} IN TRANSACTIONS OF 1000 ROWS