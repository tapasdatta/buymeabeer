defmodule Buymeabeer.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :name, :string
      add :slug, :string
      add :beer_price, :float

      timestamps(type: :utc_datetime)
    end
  end
end
