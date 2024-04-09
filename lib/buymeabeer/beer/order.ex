defmodule Buymeabeer.Beer.Order do
  alias Buymeabeer.Pages.Page
  alias Buymeabeer.Accounts.User
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :number_of_beers, :integer
    field :unit_price, :float, default: 0.00

    timestamps(type: :utc_datetime)

    belongs_to :user, User
    belongs_to :page, Page
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:number_of_beers])
    |> validate_required([:number_of_beers])
    |> validate_number(:number_of_beers, greater_than: 0, less_than: 11)
    |> add_unit_price()
  end

  defp add_unit_price(changeset) do
    # get this value from  db
    unit_price = 1.00

    changeset
    |> put_change(:unit_price, unit_price)
  end
end
