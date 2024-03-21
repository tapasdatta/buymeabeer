defmodule BuymeabeerWeb.UserRegisterJSON do
  alias Buymeabeer.Accounts.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      email: user.email,
      hashed_password: user.hashed_password
    }
  end

  def token(%{token: token, user: user}) do
    %{
      id: user.id,
      token: token
    }
  end
end
