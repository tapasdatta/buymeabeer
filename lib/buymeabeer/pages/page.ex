defmodule Buymeabeer.Pages.Page do
  @moduledoc """
  Page schema module to handle page related operation.
  """
  alias Buymeabeer.Beer.Order
  alias Buymeabeer.Accounts.User
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :name, :string
    field :slug, :string
    field :beer_price, :float, default: 1.00

    timestamps(type: :utc_datetime)

    belongs_to :user, User
    has_many :orders, Order
  end

  @doc """
  A changeset for the page creation.
  """
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:name, :slug, :beer_price])
    |> validate_required([:name, :slug, :beer_price])
    |> validate_number(:beer_price, greater_than_or_equal_to: 1.00)
  end
end
