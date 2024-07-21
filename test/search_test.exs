defmodule Blockbuster.Helpers.SearchTest do
  use ExUnit.Case
  alias Blockbuster.Helpers.Search
  alias Blockbuster.Video

  describe "search_by_title/1" do
    setup do
      # Mock data
      movies = [
        %Video{title: "The Matrix"},
        %Video{title: "Inception"},
        %Video{title: "Interstellar"},
        %Video{title: "The Matrix Reloaded"}
      ]

      # Inject the mock data into the search function
      {:ok, movies: movies}
    end

    test "returns movies that match the search criteria", %{movies: movies} do
      assert Search.search_by_title("matrix", movies) == [
               %Video{title: "The Matrix"},
               %Video{title: "The Matrix Reloaded"}
             ]
    end

    test "returns an empty list if no movies match the search criteria", %{movies: movies} do
      assert Search.search_by_title("nonexistent", movies) == []
    end

    test "is case insensitive", %{movies: movies} do
      assert Search.search_by_title("INCEPTION", movies) == [
               %Video{title: "Inception"}
             ]
    end

    test "returns partial matches", %{movies: movies} do
      assert Search.search_by_title("Inter", movies) == [
               %Video{title: "Interstellar"}
             ]
    end
  end
end
