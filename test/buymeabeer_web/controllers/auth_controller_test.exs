defmodule BuymeabeerWeb.AuthControllerTest do
  use BuymeabeerWeb.ConnCase

  @create_attrs %{
    email: "test@gmail.com",
    password: "secretpass"
  }
  @invalid_attrs %{email: nil, password: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "login user" do
    test "logins user when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/users/register", user: @create_attrs)
      assert json_response(conn, 201)["data"]

      conn = post(conn, ~p"/api/users/log_in", user: @create_attrs)

      assert json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/users/register", user: @invalid_attrs)

      assert(json_response(conn, 422)["errors"] != %{})
    end
  end
end
