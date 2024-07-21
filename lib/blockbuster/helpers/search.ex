# used to search a movie by title in the mock database which is a json
# file. The search is case insensitive and partial matches are allowed.
defmodule Blockbuster.Helpers.Search do
  @moduledoc """
  A module to search for a movie by title in the mock database.
  returns a list of movies that match the search criteria.
  """

  @spec search_by_title(String.t(), [Blockbuster.Video.t()]) :: [Blockbuster.Video.t()]
  def search_by_title(title, movies) do
    Enum.filter(movies, fn movie ->
      String.contains?(String.downcase(movie.title), String.downcase(title))
    end)
  end
end
