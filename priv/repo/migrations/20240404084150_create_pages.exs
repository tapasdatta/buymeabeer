defmodule Buymeabeer.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :user_id, :integer, references(:users, on_delete: :delete_all), null: false
      add :name, :string, null: false
      add :slug, :string, null: false
      add :beer_price, :float, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:pages, [:user_id])
  end
end
