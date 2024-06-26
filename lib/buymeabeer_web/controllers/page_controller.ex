defmodule BuymeabeerWeb.PageController do
  use BuymeabeerWeb, :controller

  alias Buymeabeer.Pages
  alias Buymeabeer.Pages.Page

  action_fallback BuymeabeerWeb.FallbackController

  def index(conn, _params) do
    pages = Pages.list_pages()
    render(conn, :index, pages: pages)
  end

  def create(conn, %{"page" => page_params}) do
    user = Guardian.Plug.current_resource(conn)

    with {:ok, %Page{} = page} <- Pages.create_page(user, page_params) do
      conn
      |> put_status(:created)
      |> render(:show, page: page)
    end
  end

  def show(conn, %{"id" => id}) do
    page = Pages.get_page!(id)
    render(conn, :show, page: page)
  end

  def update(conn, %{"id" => id, "page" => page_params}) do
    page = Pages.get_page!(id)

    with {:ok, %Page{} = page} <- Pages.update_page(page, page_params) do
      render(conn, :show, page: page)
    end
  end

  def delete(conn, %{"id" => id}) do
    page = Pages.get_page!(id)

    with {:ok, %Page{}} <- Pages.delete_page(page) do
      send_resp(conn, :no_content, "")
    end
  end
end
