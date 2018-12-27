defmodule Cultulator.Expedition.Hazard do
  @enforce_keys [:name, :aspects]
  defstruct(
    name: nil,
    curse: false,
    aspects: []
  )
end
