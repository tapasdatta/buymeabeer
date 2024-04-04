defmodule Buymeabeer.Pages.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :name, :string
    field :slug, :string
    field :beer_price, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:name, :slug, :beer_price])
    |> validate_required([:name, :slug, :beer_price])
  end
end
