defmodule Blockbuster.Application do
  use Application

  def start(_type, _args) do
    Blockbuster.shop_title()
    {:ok, self()}
  end
end
