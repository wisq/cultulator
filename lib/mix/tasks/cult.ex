defmodule Mix.Tasks.Cult do
  use Mix.Task

  def run([]) do
    Mix.Task.run("cult.expeditions")
    Mix.Task.run("cult.index")
  end

  def run(_) do
    Mix.raise("cult does not accept arguments")
  end
end
