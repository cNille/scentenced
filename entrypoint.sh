#!/bin/bash
# Docker entrypoint script.

# Install JS libraries
cd assets && npm install && npm run deploy
cd ..

# Wait until Postgres is ready
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$PGHOST $PGPORT $PGUSER"
  echo "$(date) - waiting for database to start"
  sleep 2
done

echo "Done waiting..."

# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
  echo "Database $PGDATABASE does not exist. Creating..."
  createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
  mix ecto.migrate
  mix run priv/repo/seeds.exs
  echo "Database $PGDATABASE created."
fi

echo "Executing phoenix server..."

mix ecto.migrate
exec mix phx.server
