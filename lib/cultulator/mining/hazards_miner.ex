defmodule Cultulator.Mining.HazardsMiner do
  alias Cultulator.Expedition.Hazard
  alias Cultulator.Mining.{GameData, Util}

  def extract do
    obstacles = GameData.obstacles()

    GameData.vault_locks()
    |> Enum.map(fn {id, lock} ->
      %Hazard{
        name: Util.shorten(lock.label),
        card_id: id,
        curse: Map.has_key?(lock.aspects, :curse),
        aspects: find_aspects(id, obstacles)
      }
    end)
    |> Enum.sort_by(&sort_key/1)
  end

  defp sort_key(%Hazard{card_id: id}), do: id

  defp find_aspects(id, obstacles) do
    obstacles
    |> Map.fetch!("explorevault#{id}_encounter")
    |> Map.fetch!(:alternativerecipes)
    |> Enum.flat_map(fn %{id: id} ->
      Map.fetch!(obstacles, id)
      |> Map.fetch!(:requirements)
      |> Map.keys()
    end)
    |> Enum.uniq()
    |> Enum.sort()
  end
end
