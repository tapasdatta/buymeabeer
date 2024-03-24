defmodule BuymeabeerWeb.AuthJSON do
  @doc """
  Renders login token.
  """
  def show(%{token: token}) do
    %{token: token}
  end
end
