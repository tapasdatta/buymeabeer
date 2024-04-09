defmodule BuymeabeerWeb.Router do
  use BuymeabeerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Guardian JWT authentication plug for protected routes.
  pipeline :auth do
    plug BuymeabeerWeb.Pipeline
  end

  # User auth routes.
  scope "/api", BuymeabeerWeb do
    pipe_through :api

    post "/users/register", UserRegisterController, :create
    post "/users/log_in", AuthController, :create
  end

  # Login protected routes

  scope "/api", BuymeabeerWeb do
    pipe_through [:api, :auth]

    resources "/pages", PageController, except: [:new, :edit]
    resources "/orders", OrderController, except: [:new, :edit]
  end
end
