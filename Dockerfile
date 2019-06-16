# Extend from the official Elixir image
FROM elixir:latest

# Instal psql client
RUN apt-get update && apt-get install -y postgresql-client

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
WORKDIR /app

# Set and expose PORT environmental variable
ENV PORT ${PORT:-4000}
ENV DATABASE_URL ecto://postgres:postgres@db
EXPOSE $PORT

# Install hex (Elixir package manager)
RUN mix local.hex --force

# Install rebar (Erlang build tool)
RUN mix local.rebar --force

# Copy all dependencies files
COPY mix.* ./

# Install all production dependencies
RUN mix deps.get

# Compile all dependencies
RUN mix deps.compile

# Copy all application files
COPY . .

# RUN mix do compile

# RUN mix ecto.create

# Run entrypoint to setup server when psql server is up.
CMD ["/app/entrypoint.sh"]
