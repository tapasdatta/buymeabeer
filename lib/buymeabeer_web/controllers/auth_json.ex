defmodule BuymeabeerWeb.AuthJSON do
  @doc """
  Renders login token.
  """
  def show(%{token: token}) do
    %{data: data(token)}
  end

  defp data(token) do
    %{
      token: token
    }
  end
end
