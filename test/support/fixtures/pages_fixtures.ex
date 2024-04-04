defmodule Buymeabeer.PagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Buymeabeer.Pages` context.
  """

  @doc """
  Generate a page.
  """
  def page_fixture(attrs \\ %{}) do
    {:ok, page} =
      attrs
      |> Enum.into(%{
        beer_price: 120.5,
        name: "some name",
        slug: "some slug"
      })
      |> Buymeabeer.Pages.create_page()

    page
  end
end
