# PostgreSQL 10.1 on Alpine 3.6
# Dockerfile: https://github.com/docker-library/postgres/blob/master/10/alpine/Dockerfile
# Postgres Usage: https://hub.docker.com/r/library/postgres/
# Alpine Usage: http://gliderlabs.viewdocs.io/docker-alpine/usage/
# Environment variables:
# - POSTGRES_USER (default: `postgres`)
# - POSTGRES_PASSWORD
# - POSTGRES_DB (default: `POSTGRES_USER`)
# - PGDATA (default: `/var/lib/postgresql/data`)
# - POSTGRES_INITDB_ARGS
# - POSTGRES_INITDB_WALDIR
FROM postgres:10.1-alpine


# @BUG "sh: locale: not found" / "no usable system locales were found"
# See https://github.com/docker-library/postgres/issues/337
# ENV LANG en_US.utf8
# RUN apk add --no-cache tzdata

# Install dependencies.
RUN apk add --no-cache bash

# Copy scripts to be executed during the PostgreSQL init process.
COPY initdb.d/* /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/*.sh
