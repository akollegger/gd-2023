
// Create indexes
CREATE INDEX place_by_geonameid IF NOT EXISTS FOR (n:Place) on (n.geonameid);
CREATE INDEX airport_by_iata IF NOT EXISTS FOR (n:Airport) on (n.iata);
