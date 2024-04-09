defmodule BuymeabeerWeb.OrderJSON do
  alias Buymeabeer.Beer.Order

  @doc """
  Renders a list of orders.
  """
  def index(%{orders: orders}) do
    %{data: for(order <- orders, do: data(order))}
  end

  @doc """
  Renders a single order.
  """
  def show(%{order: order}) do
    %{data: data(order)}
  end

  defp data(%Order{} = order) do
    %{
      id: order.id,
      number_of_beers: order.number_of_beers,
      unit_price: order.unit_price
    }
  end
end
