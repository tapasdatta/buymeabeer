defmodule BuymeabeerWeb.UserRegisterController do
  use BuymeabeerWeb, :controller

  alias Buymeabeer.Accounts
  alias Buymeabeer.Accounts.User

  action_fallback BuymeabeerWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.register_user(user_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/register")
      |> render(:token, user: user)
    end
  end
end
