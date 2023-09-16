
// Create indexes
CREATE INDEX product_by_asin IF NOT EXISTS FOR (n:Product) on (n.asin);
CREATE INDEX reviewer_by_id IF NOT EXISTS FOR (n:Reviewer) on (n.reviewerID);
CREATE INDEX review_at_timestamp IF NOT EXISTS FOR (n:Review) on (n.asin, n.unixReviewTime);
CREATE FULLTEXT INDEX product_by_title IF NOT EXISTS FOR (n:Product) ON EACH [n.title];
