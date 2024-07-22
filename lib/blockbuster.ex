defmodule Blockbuster do
  @moduledoc """
  A module to display ASCII art for Blockbuster.
  """

  @ascii_art_file Path.join(:code.priv_dir(:blockbuster), "blockbuster.txt")

  def shop_title do
    @ascii_art_file
    |> File.read!()
    |> IO.puts()
  end

  def app_start(args) do
    case parse_args(args) do
      {:name, name} ->
        IO.puts("Hello #{name}, welcome to Blockbuster!")

      :help ->
        IO.puts("""
        Usage:
          blockbuster name <YourName>      # Print a welcome message with your name
          blockbuster help                 # Show this help message
        """)

      :invalid ->
        IO.puts("Invalid command. Use `blockbuster help` for usage information.")
    end
  end

  defp parse_args(["name", name]), do: {:name, name}
  defp parse_args(["help"]), do: :help
  defp parse_args(_), do: :invalid
end
