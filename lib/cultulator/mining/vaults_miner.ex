defmodule Cultulator.Mining.VaultsMiner do
  alias Cultulator.Expedition.Vault
  alias Cultulator.Mining.{GameData, Util}

  def extract do
    explore_data = GameData.explore_vaults()
    v_levels = extract_vault_levels()

    GameData.vaults()
    |> Enum.map(fn {id, data} ->
      %Vault{
        name: Util.shorten(data.label),
        card_id: id,
        history_level: find_level(id, v_levels),
        repeatable: String.ends_with?(id, "default"),
        hazards: find_hazards(id, explore_data)
      }
    end)
    |> Enum.sort_by(&sort_key/1)
  end

  defp sort_key(%Vault{card_id: i, history_level: l, repeatable: r}) do
    {l, r, i}
  end

  defp find_level("vaultfloating" <> _, levels_data), do: nil
  defp find_level(id, levels_data), do: Map.fetch!(levels_data, id)

  defp find_hazards(id, explore_data) do
    explore_data
    |> Map.fetch!("explore_#{id}_setup")
    |> Map.fetch!(:effects)
    |> Map.keys()
  end

  defp extract_vault_levels do
    v_decks = extract_vault_decks()
    f_levels = extract_history_fragment_levels()

    GameData.explore_secret_histories()
    |> Enum.filter(fn {id, _} -> id =~ ~r{^explorefindvault_[a-z]$} end)
    |> Enum.flat_map(fn {_, data} ->
      [vdeck] = Map.keys(data.deckeffect)
      [history] = Map.keys(data.requirements)

      vault_ids = Map.fetch!(v_decks, Atom.to_string(vdeck))
      level = Map.fetch!(f_levels, Atom.to_string(history))

      vault_ids
      |> Enum.map(fn v_id -> {v_id, level} end)
    end)
    |> Map.new()
  end

  defp extract_vault_decks do
    GameData.deck("vaults")
    |> Map.new(fn {id, data} ->
      {id, [data.defaultcard | data.spec]}
    end)
  end

  defp extract_history_fragment_levels do
    GameData.fragments()
    |> Enum.filter(fn {id, _} -> String.starts_with?(id, "fragmentsecrethistories") end)
    |> Map.new(fn {id, data} ->
      {id, data.aspects.secrethistories}
    end)
  end
end
