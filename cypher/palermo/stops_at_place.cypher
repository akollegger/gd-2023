// How many stops are there at each place?
MATCH (s:Stop)-[:AT]->(p:Place)
WITH p.name as name, count (s) as stopsAtPlace
RETURN stopsAtPlace, count(stopsAtPlace) as total 
ORDER BY stopsAtPlace