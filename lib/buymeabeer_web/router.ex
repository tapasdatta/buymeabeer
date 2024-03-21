defmodule BuymeabeerWeb.Router do
  use BuymeabeerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BuymeabeerWeb do
    pipe_through :api

    post "/users/register", UserRegisterController, :create
    # post "/brewers/log_in", AuthController, :create
  end
end
