defmodule Blockbuster.AsciiArt do
  @art_file "/Users/leviathan/_CS/_projects/elixir/blockbuster/priv/blockbuster.txt"

  def shop_title() do
    @art_file
    |> File.read!(@art_file)
    |> IO.puts()
  end
end
