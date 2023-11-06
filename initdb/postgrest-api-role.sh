#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE ROLE api WITH LOGIN PASSWORD 'api_password';
    ALTER ROLE api SET search_path TO public;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO api;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO api;
EOSQL
