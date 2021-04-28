defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, return the item" do
      response =
        Item.build(
          "Pizza margherita",
          :pizza,
          "49.90",
          1
        )

      expected_response = { :ok, build(:item) }

      assert response == expected_response
    end

    test "when quantity is invalid, returns an error" do
      response =
        Item.build(
          "Pizza margherita",
          :pizza,
          "49.90",
          0
        )

      expected_response = {:error, "Quantity must be a positive integer"}

      assert response == expected_response
    end

    test "when category is invalid, returns an error" do
      response =
        Item.build(
          "Pizza margherita",
          :wrong,
          "49.90",
          1
        )

      expected_response = {:error, "Invalid category"}

      assert response == expected_response
    end
  end
end
