defmodule BuymeabeerWeb.PageJSON do
  alias Buymeabeer.Pages.Page

  @doc """
  Renders a list of pages.
  """
  def index(%{pages: pages}) do
    %{data: for(page <- pages, do: data(page))}
  end

  @doc """
  Renders a single page.
  """
  def show(%{page: page}) do
    %{data: data(page)}
  end

  defp data(%Page{} = page) do
    %{
      id: page.id,
      name: page.name,
      slug: page.slug,
      beer_price: page.beer_price
    }
  end
end
