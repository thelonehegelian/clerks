defmodule Blockbuster.AllMovies do
  alias Blockbuster.Video

  def all_movies do
    json_filepath = "/Users/leviathan/_CS/_projects/elixir/blockbuster/priv/movies.json"

    {:ok, content} = File.read(json_filepath)
    %{"movies" => movies} = Jason.decode!(content)

    Enum.map(movies, fn movie ->
      %Video{
        title: movie["title"],
        rating: movie["rating"],
        genre: movie["genre"],
        year: movie["year"],
        is_rented: movie["is_rented"],
        rental_date: movie["rental_date"]
      }
    end)
  end
end
