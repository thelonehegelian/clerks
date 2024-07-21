defmodule Blockbuster.Video do
  @moduledoc """
  Documentation for `Blockbuster.Video`.
  """

  @type t :: %__MODULE__{
          title: String.t(),
          rating: String.t(),
          genre: String.t(),
          year: integer(),
          is_rented: boolean(),
          rental_date: Date.t()
        }
  defstruct [:title, :rating, :genre, :year, :is_rented, :rental_date]
end
