defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Pedro",
      email: "pedro@mail.com",
      cpf: "123123123",
      age: 27,
      address: "Bairro Floresta"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza margherita",
      quantity: 1,
      unity_price: Decimal.new("49.90")
    }
  end

  def order_factory do
    %Order{
      user_cpf: "123123123",
      delivery_address: "Bairro Floresta",
      total_price: Decimal.new("99.80"),
      items: [
        build(:item),
        build(:item)
      ]
    }
  end
end
