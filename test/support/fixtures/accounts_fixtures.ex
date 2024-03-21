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
        email: "some email",
        hashed_password: "some hashed_password",
        name: "some name"
      })
      |> Buymeabeer.Accounts.create_user()

    user
  end
end
