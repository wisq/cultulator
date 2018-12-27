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
    |> combine_no_curse()
    |> Enum.group_by(& &1.for_no_curse)
    |> Enum.flat_map(fn {_fnc, cs} -> combine_success(cs) end)
  end

  defp combine_no_curse(combos) do
    combos
    |> Enum.group_by(&remove_no_curse/1)
    |> Enum.flat_map(fn {template, cs} ->
      Enum.map(cs, & &1.for_no_curse)
      |> merge_options()
      |> Enum.map(fn opts ->
        %Combo{template | for_no_curse: opts}
      end)
    end)
  end

  defp combine_success(combos) do
    template = List.first(combos)

    combos
    |> Enum.map(& &1.for_success)
    |> merge_options()
    |> Enum.map(fn opts ->
      %Combo{template | for_success: opts}
    end)
  end

  defp count_in_combos(item, lists) do
    Enum.count(lists, &(item in &1))
  end

  defp sort_combo_fields(%Combo{for_success: fs, for_no_curse: fnc} = c) do
    %Combo{c | for_success: Enum.sort(fs), for_no_curse: Enum.sort(fnc)}
  end

  defp remove_no_curse(%Combo{} = c), do: %Combo{c | for_no_curse: nil}

  def merge_options(lists) do
    cond do
      # Just one list; return it.
      length(lists) == 1 ->
        lists

      # All lists are length 1.
      Enum.all?(lists, &(length(&1) == 1)) ->
        # Combine them into a single choice:
        options =
          lists
          |> List.flatten()
          |> Enum.uniq()

        [[%Choice{list: options}]]

      # Lists are longer than 1.
      true ->
        # Find the most popular elements:
        most_popular =
          List.flatten(lists)
          |> Enum.uniq()
          |> Enum.sort_by(&{-count_in_combos(&1, lists), &1})

        # Going from most to least popular,
        lists
        # ... find lists that match <item>,
        |> Enum.group_by(&earliest_match(&1, most_popular))
        # ... and make a new set of lists that are
        #     <item> + zipped sub-choices.
        |> Enum.flat_map(fn {index, matching} ->
          first = Enum.at(most_popular, index)

          matching
          |> Enum.map(&List.delete(&1, first))
          |> merge_options()
          |> Enum.map(fn zipped -> [first | zipped] end)
        end)
    end
  end

  defp earliest_match(list, popular) do
    popular
    |> Enum.find_index(&Enum.member?(list, &1))
  end
end
