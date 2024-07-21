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
  defstruct [:name, :age, :is_member, :rental_history]
end
