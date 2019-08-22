# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :ex_bin, ExBinWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FYf0zB1ugGYRpY5w0IOOQs8Hd1+vH1T/rRSIpL2W8VaIc7fS5Rwzne51Rq9Eiv0o",
  render_errors: [view: ExBinWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExBin.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
