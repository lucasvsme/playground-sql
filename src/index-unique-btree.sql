CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  full_name VARCHAR,
  email TEXT NOT NULL
);

CREATE INDEX full_name_idx ON contacts(full_name);
CREATE UNIQUE INDEX email_unique_idx
ON contacts
USING btree (lower(email));
SELECT indexname, indexdef FROM pg_indexes WHERE tablename = 'contacts';

INSERT INTO contacts (full_name, email) VALUES ('John Smith', 'john.smith@email.com');
INSERT INTO contacts (id, full_name, email) VALUES (uuid_generate_v4(), 'Mary Jane', 'mary.jane@email.com');
SELECT id, full_name, email FROM contacts;

