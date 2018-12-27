defmodule Cultulator.Expedition.Solver do
  alias Cultulator.Expedition.{Hazard, Vault, Data}

  defmodule SimState do
    @enforce_keys [:failed, :cursed]
    defstruct(
      failed: false,
      cursed: false
    )

    def initial, do: %SimState{failed: false, cursed: false}
    def success?(%SimState{failed: f}), do: !f
    def not_cursed?(%SimState{failed: f, cursed: c}), do: !(f || c)
  end

  defmodule Combo do
    defstruct(
      for_success: [],
      for_no_curse: []
    )

    def new, do: %Combo{}

    def aspects(%Combo{for_success: fs, for_no_curse: fnc}), do: MapSet.new(fs ++ fnc)

    def size(%Combo{for_success: fs, for_no_curse: fnc}), do: length(fs) + length(fnc)

    def sort_key(%Combo{for_success: fs, for_no_curse: fnc}) do
      {length(fs), length(fnc)}
    end
  end

  def solve(%Vault{hazards: hazards}) do
    aspects = all_aspects(hazards)

    combos = find_all_combos(aspects, hazards)
    min_size = Enum.map(combos, &Combo.size/1) |> Enum.min()

    combos
    |> Enum.filter(fn c -> Combo.size(c) == min_size end)
    |> Enum.sort_by(&Combo.sort_key/1)
    |> Enum.uniq_by(&Combo.aspects/1)
  end

  defp all_aspects(hazards) do
    hazards
    |> Enum.flat_map(& &1.aspects)
    |> Enum.uniq()
    |> Enum.sort()
  end

  defp find_all_combos(aspects, hazards, combo \\ Combo.new()) do
    result = simulate(Combo.aspects(combo), hazards)

    cond do
      SimState.not_cursed?(result) ->
        [combo]

      SimState.success?(result) ->
        appended_combos(combo, aspects, :for_no_curse)
        |> Enum.flat_map(&find_all_combos(aspects, hazards, &1))

      true ->
        appended_combos(combo, aspects, :for_success)
        |> Enum.flat_map(&find_all_combos(aspects, hazards, &1))
    end
  end

  defp appended_combos(combo, aspects, field) do
    aspects
    |> Enum.flat_map(fn a ->
      if a in combo.for_success || a in combo.for_no_curse do
        []
      else
        list = Map.fetch!(combo, field)
        [Map.put(combo, field, [a | list])]
      end
    end)
  end

  defp simulate(aspects_avail, hazards) do
    Enum.reduce_while(hazards, SimState.initial(), fn hazard, state ->
      cond do
        Enum.any?(hazard.aspects, fn a -> a in aspects_avail end) ->
          # Pass: We've brought one of the needed aspects.
          {:cont, state}

        hazard.curse ->
          # Fail, but hazard is a curse.
          # This doesn't fail the expedition, but does curse it.
          {:cont, %SimState{state | cursed: true}}

        true ->
          # Fail.  (No need to check for later curses.)
          {:halt, %SimState{state | failed: true}}
      end
    end)
  end
end
