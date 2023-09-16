// relate each Person to a named Place
:auto
MATCH (place:Place) 
WHERE place.population > 1000
WITH collect(place) as places
MATCH (person:Reviewer)
WITH person, apoc.coll.randomItem(places) as home
CALL {
    WITH person, home
    MERGE (person)-[:HOME_TOWN]->(home)
} IN TRANSACTIONS OF 1000 ROWS