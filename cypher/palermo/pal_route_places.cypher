// Add routes directly between named Places
MATCH (start:Place)<-[:AT]-(from:Stop)-[:BUS_ROUTE]->(to:Stop)-[:AT]->(destination:Place)
MERGE (start)-[r:ROUTE]->(destination)
