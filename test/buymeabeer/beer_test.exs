defmodule Buymeabeer.BeerTest do
  use Buymeabeer.DataCase

  alias Buymeabeer.Beer

  describe "orders" do
    alias Buymeabeer.Beer.Order

    import Buymeabeer.BeerFixtures

    @invalid_attrs %{number_of_beers: nil, unit_price: nil}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Beer.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Beer.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{number_of_beers: 42, unit_price: 120.5}

      assert {:ok, %Order{} = order} = Beer.create_order(valid_attrs)
      assert order.number_of_beers == 42
      assert order.unit_price == 120.5
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Beer.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{number_of_beers: 43, unit_price: 456.7}

      assert {:ok, %Order{} = order} = Beer.update_order(order, update_attrs)
      assert order.number_of_beers == 43
      assert order.unit_price == 456.7
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Beer.update_order(order, @invalid_attrs)
      assert order == Beer.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Beer.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Beer.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Beer.change_order(order)
    end
  end
end
