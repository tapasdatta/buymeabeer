defmodule BuymeabeerWeb.UserRegisterJSON do
  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(user) do
    %{
      id: user.id,
      token: user.token
    }
  end
end
