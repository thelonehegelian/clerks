defmodule Blockbuster.CustomerTest do
  use ExUnit.Case
  alias Blockbuster.Customer

  describe "create_customer/3" do
    test "creates a customer with the given attributes" do
      name = "John Doe"
      age = 30
      is_member = true

      customer = Customer.create_customer(name, age, is_member)

      assert %Customer{name: ^name, age: ^age, is_member: ^is_member, rental_history: []} =
               customer
    end
  end

  describe "add_customer_to_db/1" do
    setup do
      file_path =
        "/Users/leviathan/_CS/_projects/elixir/blockbuster/test/test_data/customers.json"

      # Ensure the test file is clean before each test
      File.rm(file_path)
      # create empty file if it doesn't exist
      unless File.exists?(file_path) do
        File.touch(file_path)
      end

      :ok
    end

    test "adds a customer to the database" do
      customer = %Customer{name: "Jane Doe", age: 25, is_member: false, rental_history: []}
      db_path = "/Users/leviathan/_CS/_projects/elixir/blockbuster/test/test_data/customers.json"
      assert :ok = Customer.add_customer_to_db(customer, db_path)

      # Read the file and check its contents
      {:ok, content} =
        File.read(
          "/Users/leviathan/_CS/_projects/elixir/blockbuster/test/test_data/customers.json"
        )

      assert content =~ Jason.encode!(customer)
    end
  end
end
