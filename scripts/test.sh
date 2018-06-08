#!/bin/bash
# Docker entrypoint script.

# Wait until Postgres is ready
echo "Testing if Postgres is accepting connections. {$PGHOST} {$PGPORT} ${PGUSER}"
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

RAILS_ENV=test bin/rails db:drop db:create db:migrate db:seed test
