// load edges
WITH "http://localhost:11001/project-5b6d1337-a0c4-4066-ae9d-ec665dd3a51b/data/git_web_ml/musae_git_edges.csv" as URL
LOAD CSV WITH HEADERS from URL as row
MATCH (dev1:Developer {id:row.id_1}), (dev2:Developer {id:row.id_2})
MERGE (dev1)-[r:KNOWS]->(dev2) 
RETURN r LIMIT 10