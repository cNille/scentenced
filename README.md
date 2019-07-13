# SCENTENCED
SCENTENCED to smell good. A website where you can store your reviews on perfumes, data about ingredients and store your recipes for perfumes


## DevOps

To run scentenced you need to have environmental variables to for connecting 
to the database server.  Save the env variables in a .env file.

### Local server

Sample lokal `.env` file:

```
export PGUSER=USR
export PGPASSWORD=PW
export PGDATABASE=DB
export PGHOST=HOST
```

Once the file is created you can import the env variables through sourcing
the file. Do this with:

```
source .env
```

Then to run the server local, just run:

```
mix phx.server
```

### Docker

You can also create the server with docker-compose. A tip is to create an 
postgres instance in a container and assigning it to a docker network. 

Create an docker-compose for the database (in another repo...):
```
version: '3.1'

services:
  db:
    image: postgres:latest
    restart: always
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: ${PGPASSWORD}
      POSTGRES_USER: ${PGUSER}
    ports:
      - 5432:5432

volumes:
  db-data:
    driver: local

networks:
  default:
    external:
      name: my-network

```

Then run: 
```
docker network create my-network
docker-compose up -d
```

Now you can connect our docker container to the database through using `db` as
host.


## Pheonix

To start your Phoenix server:


  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
