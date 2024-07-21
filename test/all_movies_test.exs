defmodule Blockbuster.AllMoviesTest do
  use ExUnit.Case
  alias Blockbuster.AllMovies
  alias Blockbuster.Video

  @json_filepath "/Users/leviathan/_CS/_projects/elixir/blockbuster/test/test_data/test_movies.json"
  setup_all do
    # Ensure the movie.json file is created for the test
    :ok = File.write(@json_filepath, ~s({
      "movies": [
        {
          "title": "The Shawshank Redemption",
          "rating": "9.3",
          "genre": "Drama",
          "year": 1994,
          "is_rented": false,
          "rental_date": ""
        },
        {
          "title": "The Godfather",
          "rating": "9.2",
          "genre": "Crime",
          "year": 1972,
          "is_rented": true,
          "rental_date": "2022-10-15"
        }
      ]
    }))
    :ok
  end

  test "all_movies/0 parses and returns a list of movies" do
    expected_movies = [
      %Video{
        title: "The Shawshank Redemption",
        rating: "9.3",
        genre: "Drama",
        year: 1994,
        is_rented: false,
        rental_date: ""
      },
      %Video{
        title: "The Godfather",
        rating: "9.2",
        genre: "Crime",
        year: 1972,
        is_rented: true,
        rental_date: "2022-10-15"
      }
    ]

    assert AllMovies.all_movies() == expected_movies
  end
end
