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
end
