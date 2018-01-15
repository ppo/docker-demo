#!/usr/bin/env bash

set -e


# Create the user and the database, and configure permissions.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE ROLE "$APP_DB_USER" WITH LOGIN PASSWORD '$APP_DB_PASSWORD';
  CREATE DATABASE "$APP_DB_NAME";
  GRANT ALL PRIVILEGES ON DATABASE "$APP_DB_NAME" TO "$APP_DB_USER";
EOSQL
