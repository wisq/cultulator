defmodule Cultulator.Expedition.Combiner do
  alias Cultulator.Expedition.Solver.Combo

  defmodule Choice do
    @enforce_keys [:list]
    defstruct(list: nil)
  end

  defimpl Inspect, for: Choice do
    import Inspect.Algebra

    def inspect(obj, opts) do
      concat(["#Combiner.Choice<", to_doc(obj.list, opts), ">"])
    end
  end

  def combine(combos) do
    combos
    |> Enum.map(&sort_combo_fields/1)
    |> Enum.group_by(&remove_no_curse/1)
    |> Enum.map(fn {template, cs} ->
      option_lists =
        Enum.map(cs, & &1.for_no_curse)
        |> zip_options()

      %Combo{template | for_no_curse: option_lists}
    end)
  end

  defp sort_combo_fields(%Combo{for_success: fs, for_no_curse: fnc} = c) do
    %Combo{c | for_success: Enum.sort(fs), for_no_curse: Enum.sort(fnc)}
  end

  defp remove_no_curse(%Combo{} = c), do: %Combo{c | for_no_curse: nil}

  def zip_options([[]]), do: []

  def zip_options(combos) do
    firsts = Enum.map(combos, &List.first/1) |> Enum.uniq()
    rests = Enum.map(combos, &Enum.drop(&1, 1)) |> Enum.uniq()
    options = %Choice{list: firsts}

    [options | zip_options(rests)]
  end
end
