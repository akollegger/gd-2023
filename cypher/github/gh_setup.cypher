
// Create indexes
CREATE INDEX dev_by_id IF NOT EXISTS FOR (d:Developer) on (d.id);
