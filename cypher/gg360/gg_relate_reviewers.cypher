// relate reviewers to each other where common reviews exist
:auto
MATCH (reviewer:Reviewer)-[:WROTE]->(:Review)-[:REVIEWS]->(product:Product)
WITH product, collect(reviewer) AS commonReviewers
RETURN product, size(commonReviewers) LIMIT 10