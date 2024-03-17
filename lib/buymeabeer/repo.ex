defmodule Buymeabeer.Repo do
  use Ecto.Repo,
    otp_app: :buymeabeer,
    adapter: Ecto.Adapters.Postgres
end
