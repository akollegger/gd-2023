
// Create indexes
CREATE INDEX stop_by_id IF NOT EXISTS FOR (n:Stop) on (n.id);
CREATE INDEX place_by_name IF NOT EXISTS FOR (n:Place) on (n.name);
