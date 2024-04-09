defmodule BuymeabeerWeb.OrderController do
  use BuymeabeerWeb, :controller

  alias Buymeabeer.Beer
  alias Buymeabeer.Beer.Order

  action_fallback BuymeabeerWeb.FallbackController

  def index(conn, _params) do
    orders = Beer.list_orders()
    render(conn, :index, orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    user = Guardian.Plug.current_resource(conn)
    %{"page" => page} = order_params

    with {:ok, %Order{} = order} <- Beer.create_order(user, page, order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/orders/#{order}")
      |> render(:show, order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Beer.get_order!(id)
    render(conn, :show, order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Beer.get_order!(id)

    with {:ok, %Order{} = order} <- Beer.update_order(order, order_params) do
      render(conn, :show, order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Beer.get_order!(id)

    with {:ok, %Order{}} <- Beer.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end
end
