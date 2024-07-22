defmodule Blockbuster.Application do
  use Application

  # Escript and direct entry point for handling command-line arguments
  def main(args) do
    Blockbuster.app_start(args)
  end

  # Normal OTP application entry point
  def start(_type, _args) do
    args = System.argv()

    Blockbuster.shop_title()
    Blockbuster.app_start(args)
    {:ok, self()}
  end
end
