// load amazon product metadata as nodes
WITH "project-5b6d1337-a0c4-4066-ae9d-ec665dd3a51b" as PROJECT_ID 
WITH "http://localhost:11001/" + PROJECT_ID + "/data/amazon/meta_Prime_Pantry.json" as URL
CALL apoc.load.json(URL) YIELD value
MERGE (p:Product {asin:value.asin})
  ON CREATE SET
    p.title = value.title,
    p.description = value.description,
    p.also_view = value.also_view,
    p.brand = value.brand
RETURN count(*)
