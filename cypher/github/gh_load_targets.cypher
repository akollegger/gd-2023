// load targets
WITH "http://localhost:11001/project-5b6d1337-a0c4-4066-ae9d-ec665dd3a51b/data/git_web_ml/musae_git_target.csv" as URL
LOAD CSV WITH HEADERS from URL as row
MERGE (dev:Developer {id:row.id}) 
ON CREATE SET dev = row
RETURN count(*)