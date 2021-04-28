defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, return the order" do
      response =
        Order.build(build(:user), build_list(2, :item))

      expected_response = { :ok, build(:order) }

      assert response == expected_response
    end

    test "when params is invalid, returns an error" do
      response =
        Order.build("teste", "teste")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
