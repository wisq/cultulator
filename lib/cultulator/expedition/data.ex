defmodule Cultulator.Expedition.Data do
  alias Cultulator.Expedition.Data.Vaults

  def vaults, do: Vaults.vaults()
end
