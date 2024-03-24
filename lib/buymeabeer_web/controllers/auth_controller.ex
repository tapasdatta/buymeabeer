defmodule BuymeabeerWeb.AuthController do
  use BuymeabeerWeb, :controller

  action_fallback BuymeabeerWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    with {:ok, token} <- Buymeabeer.Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> render(:show, token: token)
    end
  end
end
