-- Runs once, the first time the source-db volume is created.
-- The source database plays the role of an operational (OLTP) system.
-- Tables for the chosen dataset go in a later script, after ADR-000 is decided.

CREATE SCHEMA IF NOT EXISTS source;

-- Every source table will carry an updated_at column so the change simulator
-- (week 2) and the CDC consumer (week 3) can be checked against each other.
CREATE OR REPLACE FUNCTION source.set_updated_at()
RETURNS trigger AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
