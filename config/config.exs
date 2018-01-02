# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :reviewster,
  ecto_repos: [Reviewster.Repo]

# Configures the endpoint
config :reviewster, Reviewster.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R8gAfT5+Y9pIjzeQ4xXPz6e8ZtflFJhjqhyVM67T1WFeSe860FazPGj32QDT9xG/",
  render_errors: [view: Reviewster.ErrorView, accepts: ~w(json)],
  pubsub: [name: Reviewster.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
