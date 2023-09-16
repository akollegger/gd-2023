// load amazon product metadata as nodes
:auto
  WITH 'project-5b6d1337-a0c4-4066-ae9d-ec665dd3a51b' as PROJECT_ID 
  WITH 'http://localhost:11001/' + PROJECT_ID + '/data/amazon/Prime_Pantry.json' as URL
  CALL apoc.load.json(URL) YIELD value
  WITH value
  CALL { 
    WITH value
    MERGE (reviewer:Reviewer {reviewerID:value.reviewerID})
     ON CREATE SET
       reviewer.reviewerName = value.reviewerName
    MERGE (review:Review {asin:value.asin, unixReviewTime:value.unixReviewTime})
     ON CREATE SET
       review.reviewText = value.reviewText,
       review.overall = value.overall,
       review.summary = value.summary,
       review.helpful = value.helpful,
       review.reviewTime = value.reviewTime,
       review.verified = value.verified
    MERGE (reviewer)-[:WROTE]->(review)
    WITH review, value
    MATCH (product:Product {asin:value.asin})
    MERGE (review)-[:REVIEWS]->(product)
  } IN TRANSACTIONS OF 1000 ROWS
  