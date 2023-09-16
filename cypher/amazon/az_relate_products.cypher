// Relate products through "view_also" field
:auto
MATCH (product:Product)
CALL {
    WITH product
    UNWIND product.also_view as otherProductAsin
    MATCH (otherProduct:Product {asin: otherProductAsin})
    MERGE (product)-[:ALSO_VIEW]->(otherProduct)
} IN TRANSACTIONS OF 1000 ROWS