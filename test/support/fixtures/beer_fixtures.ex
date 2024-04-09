defmodule Buymeabeer.BeerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Buymeabeer.Beer` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        number_of_beers: 42,
        unit_price: 120.5
      })
      |> Buymeabeer.Beer.create_order()

    order
  end
end
