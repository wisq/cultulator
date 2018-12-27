defmodule Cultulator.Mining.ExpeditionsGenerator do
  def hazards_chunk(hazards) do
    [
      "@hazards %{\n",
      Enum.map(hazards, &dump_hazard/1)
      |> Enum.intersperse(",\n"),
      "}"
    ]
    |> IO.iodata_to_binary()
    |> Code.format_string!()
  end

  def vaults_chunk(vaults) do
    [
      "@vaults [\n",
      Enum.map(vaults, &dump_vault/1)
      |> Enum.intersperse(",\n"),
      "]"
    ]
    |> IO.iodata_to_binary()
    |> Code.format_string!()
  end

  @hazard_keys [:name, :card_id, :curse, :aspects]
  @vault_keys [:name, :card_id, :repeatable, :history_level]

  defp dump_hazard(hazard) do
    [
      "#{hazard.card_id}: %Hazard{\n",
      dump_keys(hazard, @hazard_keys, %{curse: false}),
      "\n}"
    ]
  end

  defp dump_vault(vault) do
    [
      "%Vault{\n",
      dump_keys(vault, @vault_keys, %{repeatable: false}),
      ", hazards: [\n",
      Enum.map(vault.hazards, fn h ->
        "Map.fetch!(@hazards, :#{h})"
      end)
      |> Enum.intersperse(",\n"),
      "\n]\n}"
    ]
  end

  defp dump_keys(struct, keys, defaults) do
    keys
    |> Enum.map(fn key ->
      value = Map.fetch!(struct, key)

      case Map.fetch(defaults, key) do
        {:ok, ^value} -> nil
        _ -> ["#{key}: ", inspect(value)]
      end
    end)
    |> Enum.reject(&is_nil/1)
    |> Enum.intersperse(",\n")
  end
end
