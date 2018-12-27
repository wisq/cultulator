defmodule Cultulator.Expedition.Vault do
  @enforce_keys [:name, :history_level, :hazards]
  defstruct(
    name: nil,
    card_id: nil,
    wiki_name: nil,
    repeatable: false,
    history_level: nil,
    hazards: []
  )
end
