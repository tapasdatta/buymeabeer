import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :buymeabeer, Buymeabeer.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "buymeabeer_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :buymeabeer, BuymeabeerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Etn8JGQVvR8E6A+rWnmDpClGpicpGKf9Z2dv0n6uxgBsR3VJJWhkdro3g97a60Rm",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :buymeabeer, Buymeabeer.Guardian,
  issuer: "buymeabeer",
  secret_key: "OEZYhBKd6E+d/0YyaS2XehUFCM2GD9o24VgXO0Pk7HLrmiIgbqHRwXeoJzMDy9ft"
