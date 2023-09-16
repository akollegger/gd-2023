// load bus connections as relationships
WITH "http://localhost:11001/project-5b6d1337-a0c4-4066-ae9d-ec665dd3a51b/data/palermo/network_bus.csv" as URL
LOAD CSV WITH HEADERS FROM URL AS row FIELDTERMINATOR ';'
MATCH (from:Stop {id: row.from_stop_I}),(to:Stop {id: row.to_stop_I})
MERGE (from)-[r:BUS_ROUTE]->(to)
ON CREATE 
  SET r.d = row.d, 
      r.n_vehicles = toInteger(row.n_vehicles),
      r.duration_avg = duration({minutes:toFloat(row.duration_avg)})
RETURN count(*)