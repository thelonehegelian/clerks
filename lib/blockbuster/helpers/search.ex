defmodule Blockbuster.Helpers.Search do
  @moduledoc """
  A module to search for a movie by title in the mock database.
  returns a list of movies that match the search criteria.
  """

  # TODO pass in the db_path here
  def search_by_title(title, movies) do
    Enum.filter(movies, fn movie ->
      String.contains?(String.downcase(movie.title), String.downcase(title))
    end)
  end
end
