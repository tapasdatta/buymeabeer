defmodule Buymeabeer.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :page_id, references(:pages, on_delete: :delete_all)
      add :number_of_beers, :integer
      add :unit_price, :float

      timestamps(type: :utc_datetime)
    end
  end
end
