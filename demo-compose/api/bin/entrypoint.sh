#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace


# Check whether the `postgres` service is ready by trying to connect to it.
function postgres_ready(){
python << END
from os import environ
from psycopg2 import connect, OperationalError
from sys import exit
try:
    conn = connect(host="postgres", dbname=environ["APP_DB_NAME"], user=environ["APP_DB_USER"], password=environ["APP_DB_PASSWORD"])
except OperationalError:
    exit(-1)
exit(0)
END
}


# Sleep until `postgres` is ready.
until postgres_ready; do
  >&2 echo "Service 'postgres' is unavailable, sleeping."
  sleep 1
done

# When `postgres` is ready, execute the given custom command or start this service.
>&2 echo "Service 'postgres' is ready, continuing..."

# Start this service.
python api.py
