defmodule ElixirGreeter do
  use Application

  def main(args) do
    args |> parse_args |> do_process
  end

  def parse_args(args) do
    options = OptionParser.parse(args)

    case options do
      {[name: name], _, _} -> [name]
      {[help: true], _, _} -> :help
      _ -> :help

    end
  end

  def do_process([name]) do
    IO.puts "Hello, #{name}!"
  end

  def do_process(:help) do
    IO.puts """
      Usage: 
      ./elixir_greeter --name [your name]

      Options:
      --help  Show this help message.

      Description:
      Prints out a greeting.
    """

    System.halt(0)
  end
end
