defmodule BuymeabeerWeb.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :buymeaform,
    module: Buymeabeer.Guardian,
    error_handler: BuymeabeerWeb.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
