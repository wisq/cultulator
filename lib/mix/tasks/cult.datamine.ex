defmodule Mix.Tasks.Cult.Datamine do
  use Mix.Task
  import Cultulator.Mix

  alias Cultulator.Mining.ExpeditionsGenerator

  def run([]) do
    Application.ensure_started(:briefly)
    generate_hazards()
    generate_vaults()
  end

  def run(_) do
    Mix.raise("cult.datamine does not accept arguments")
  end

  defp generate_hazards do
    ExpeditionsGenerator.generate_hazards()
    |> IO.iodata_to_binary()
    |> write_file("lib/cultulator/expedition/data/hazards.ex")
  end

  defp generate_vaults do
    ExpeditionsGenerator.generate_vaults()
    |> IO.iodata_to_binary()
    |> write_file("lib/cultulator/expedition/data/vaults.ex")
  end
end
