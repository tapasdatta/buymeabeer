defmodule BuymeabeerWeb.Router do
  use BuymeabeerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug BuymeabeerWeb.Pipeline
  end

  scope "/api", BuymeabeerWeb do
    pipe_through :api

    post "/users/register", UserRegisterController, :create
    post "/users/log_in", AuthController, :create
  end
end
