// load stops as nodes
WITH "http://localhost:11001/project-5b6d1337-a0c4-4066-ae9d-ec665dd3a51b/data/palermo/network_nodes.csv" as URL
LOAD CSV WITH HEADERS FROM URL AS row FIELDTERMINATOR ';'
MERGE (s:Stop {id: row.stop_I})
ON CREATE 
  SET s.name = row.name, 
      s.location = point({latitude: toFloat(row.lat), longitude: toFloat(row.lon)})
RETURN count(*)