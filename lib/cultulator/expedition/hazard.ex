defmodule Cultulator.Expedition.Hazard do
  @enforce_keys [:name, :aspects]
  defstruct(
    card_id: nil,
    name: nil,
    curse: false,
    aspects: []
  )
end
