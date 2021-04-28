defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, return the user" do
      response =
        User.build(
          "Pedro",
          "pedro@mail.com",
          "123123123",
          27,
          "Bairro Floresta"
        )

      expected_response = { :ok, build(:user) }

      assert response == expected_response
    end

    test "when cpf is invalid, returns an error" do
      response =
        User.build(
          "Pedro",
          "pedro@mail.com",
          23_232_232,
          27,
          "Bairro Floresta"
        )

      expected_response = {:error, "Invalid cpf"}

      assert response == expected_response
    end

    test "when age is invalid, returns an error" do
      response =
        User.build(
          "Pedro",
          "pedro@mail.com",
          "23232232",
          15,
          "Bairro Floresta"
        )

      expected_response = {:error, "User must be over 18 years"}

      assert response == expected_response
    end
  end
end
