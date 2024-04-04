defmodule BuymeabeerWeb.PageControllerTest do
  use BuymeabeerWeb.ConnCase

  import Buymeabeer.PagesFixtures

  alias Buymeabeer.Pages.Page

  @create_attrs %{
    name: "some name",
    slug: "some slug",
    beer_price: 120.5
  }
  @update_attrs %{
    name: "some updated name",
    slug: "some updated slug",
    beer_price: 456.7
  }
  @invalid_attrs %{name: nil, slug: nil, beer_price: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create page" do
    test "renders page when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/pages", page: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/pages/#{id}")

      assert %{
               "id" => ^id,
               "beer_price" => 120.5,
               "name" => "some name",
               "slug" => "some slug"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/pages", page: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update page" do
    setup [:create_page]

    test "renders page when data is valid", %{conn: conn, page: %Page{id: id} = page} do
      conn = put(conn, ~p"/api/pages/#{page}", page: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/pages/#{id}")

      assert %{
               "id" => ^id,
               "beer_price" => 456.7,
               "name" => "some updated name",
               "slug" => "some updated slug"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, page: page} do
      conn = put(conn, ~p"/api/pages/#{page}", page: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete page" do
    setup [:create_page]

    test "deletes chosen page", %{conn: conn, page: page} do
      conn = delete(conn, ~p"/api/pages/#{page}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/pages/#{page}")
      end
    end
  end

  defp create_page(_) do
    page = page_fixture()
    %{page: page}
  end
end
