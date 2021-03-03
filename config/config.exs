# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :palantirpay,
  ecto_repos: [Palantirpay.Repo]

# Configures the endpoint
config :palantirpay, PalantirpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8z76nLa4h8MTAZhv4s//yN+GRkzrJOpBoELRN87/bO8DIXsQWXxBon3WMOyxtCm4",
  render_errors: [view: PalantirpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Palantirpay.PubSub,
  live_view: [signing_salt: "j9HlMWjr"]

config :palantirpay, Palantirpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
