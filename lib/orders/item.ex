defmodule Exlivery.Orders.Item do
  @categories [
    :pizza,
    :hamburguer,
    :carne,
    :prato_feito,
    :japonesa,
    :sobremesa
  ]

  @keys [:description, :category, :unity_price, :quantity]
  @enforce_keys @keys

  defstruct @keys

  def build(_description, _category, _unity_price, quantity) when quantity <= 0, do: {:error, "Quantity must be a positive integer"}

  def build(_description, category, _unity_price, _quantity) when category not in @categories, do: {:error, "Invalid category"}

  def build(description, category, unity_price, quantity) do
    unity_price
    |> Decimal.cast()
    |> build_item(description, category, quantity)


  end

  defp build_item({:ok, unity_price}, description, category, quantity) do
    {:ok,
      %__MODULE__{
        description: description,
        category: category,
        unity_price: unity_price,
        quantity: quantity
      }
    }
  end

  defp build_item(:error, _description, _category, _quantity), do: {:error, "Invalid price"}
end
