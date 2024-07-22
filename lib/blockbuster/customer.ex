defmodule Blockbuster.Customer do
  @moduledoc """
  Documentation for `Blockbuster.Customer`.
  """

  @type t :: %__MODULE__{
          name: String.t(),
          age: integer(),
          is_member: boolean(),
          rental_history: list()
        }
  @derive [Jason.Encoder]
  defstruct [:name, :age, :is_member, :rental_history]

  @spec create_customer(String.t(), integer(), boolean()) :: Blockbuster.Customer.t()
  def create_customer(name, age, is_member) do
    %Blockbuster.Customer{name: name, age: age, is_member: is_member, rental_history: []}
  end

  def add_customer_to_db(customer, db_path) do
    json = Jason.encode!(customer)
    File.write(db_path, json, [:append])
  end
end
