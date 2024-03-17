defmodule BuymeabeerWeb.Router do
  use BuymeabeerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BuymeabeerWeb do
    pipe_through :api
  end
end
