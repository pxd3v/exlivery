defmodule Exlivery.Users.User do
  @keys [:name, :email, :cpf, :age, :address]
  @enforce_keys @keys

  defstruct @keys


  def build(_name, _email, _cpf, age, _address) when age < 18, do: {:error, "User must be over 18 years"}

  def build(_name, _email, cpf, _age, _address) when not is_bitstring(cpf), do: {:error, "Invalid cpf"}

  def build(name, email, cpf, age, address) do
    {:ok,
      %__MODULE__{
        age: age,
        cpf: cpf,
        email: email,
        name: name,
        address: address
      }
    }
  end
end
