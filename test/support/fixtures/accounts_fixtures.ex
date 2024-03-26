defmodule Buymeabeer.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Buymeabeer.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "test@gmail.com",
        password: "sejcdcd"
      })
      |> Buymeabeer.Accounts.register_user()

    user
  end
end
