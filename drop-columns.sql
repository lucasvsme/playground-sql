DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
  id SERIAL PRIMARY KEY,
  content TEXT,
  from_email TEXT,
  to_email TEXT,

  CONSTRAINT content_notnull CHECK (content IS NOT NULL),
  CONSTRAINT from_email_notnull CHECK (from_email IS NOT NULL),
  CONSTRAINT to_email_notnull CHECK (to_email IS NOT NULL)
);

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'messages';

ALTER TABLE messages DROP COLUMN IF EXISTS content;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'messages';

ALTER TABLE messages
DROP COLUMN from_email,
DROP COLUMN to_email;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'messages';
