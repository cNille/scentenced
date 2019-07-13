# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :scentenced,
  ecto_repos: [Scentenced.Repo]

# Configures the endpoint
config :scentenced, ScentencedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lP6GYiaYhs0GQNVbDqTEFrUJ2haRoRhnu4nmQwDN63H+Lwc4F4NK1Tf429244+ve",
  render_errors: [view: ScentencedWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Scentenced.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Guardian
config :scentenced, Scentenced.Auth.Guardian,Guardian.DB,
  issuer: "scentenced",
  secret_key: "sV0qr6zkfuao+SjQoCuksj6VUiI+bkMcgaixZUUQP48IlioPwG4MuoSS/y9FraQE",
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  ttl: { 30, :days },
  verify_issuer: true, # optional
  serializer: MyApp.GuardianSerializer

config :scentenced, Scentenced.Auth.AuthAccessPipeline,
  module: Scentenced.Auth.Guardian,
  error_handler: Scentenced.Auth.AuthErrorHandler

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
