defmodule Cultulator.Expedition.CombinerTest do
  use ExUnit.Case
  doctest Cultulator.Expedition.Combiner

  alias Cultulator.Expedition.Combiner
  alias Cultulator.Expedition.Combiner.Choice
  alias Cultulator.Expedition.Solver.Combo

  test "an empty combo is returned as-is" do
    combos = [
      %Combo{for_success: [], for_no_curse: []}
    ]

    assert Combiner.combine(combos) == combos
  end

  test "any single combo is sorted and returned" do
    assert Combiner.combine([
             %Combo{for_success: [:lantern, :moth, :grail], for_no_curse: [:knock, :edge]}
           ]) == [
             %Combo{for_success: [:grail, :lantern, :moth], for_no_curse: [:edge, :knock]}
           ]
  end

  test "no-curse options are turned into choices" do
    assert Combiner.combine([
             %Combo{for_success: [:edge, :grail, :moth], for_no_curse: [:knock]},
             %Combo{for_success: [:edge, :grail, :moth], for_no_curse: [:lantern]}
           ]) == [
             %Combo{
               for_success: [:edge, :grail, :moth],
               for_no_curse: [%Choice{list: [:knock, :lantern]}]
             }
           ]
  end

  test "regular options are grouped by the most common aspect" do
    assert Combiner.combine([
             %Combo{for_success: [:edge, :grail, :moth], for_no_curse: []},
             %Combo{for_success: [:edge, :grail, :lantern], for_no_curse: []},
             %Combo{for_success: [:grail, :knock, :lantern], for_no_curse: []}
           ]) == [
             %Combo{
               for_success: [:grail, :edge, %Choice{list: [:lantern, :moth]}],
               for_no_curse: []
             },
             %Combo{
               for_success: [:grail, :knock, :lantern],
               for_no_curse: []
             }
           ]
  end

  test "no-curse grouping takes priority over for-success grouping" do
    assert Combiner.combine([
             %Combo{for_success: [:forge, :grail, :moth], for_no_curse: [:edge]},
             %Combo{for_success: [:forge, :grail, :moth], for_no_curse: [:heart]},
             %Combo{for_success: [:forge, :grail, :lantern], for_no_curse: [:edge]},
             %Combo{for_success: [:forge, :grail, :lantern], for_no_curse: [:heart]},
             %Combo{for_success: [:edge, :grail, :moth], for_no_curse: [:forge]},
             %Combo{for_success: [:edge, :grail, :moth], for_no_curse: [:heart]},
             %Combo{for_success: [:edge, :grail, :lantern], for_no_curse: [:forge]},
             %Combo{for_success: [:edge, :grail, :lantern], for_no_curse: [:heart]}
           ]) == [
             %Combo{
               for_success: [:forge, :grail, %Choice{list: [:lantern, :moth]}],
               for_no_curse: [%Choice{list: [:edge, :heart]}]
             },
             %Combo{
               for_success: [:edge, :grail, %Choice{list: [:lantern, :moth]}],
               for_no_curse: [%Choice{list: [:forge, :heart]}]
             }
           ]
  end

  test "Tombs of the Shadowless Kings should combine properly" do
    assert Combiner.combine([
             %Combo{for_success: [:knock, :grail, :forge], for_no_curse: []},
             %Combo{for_success: [:lantern, :grail, :forge], for_no_curse: []},
             %Combo{for_success: [:winter, :knock, :grail], for_no_curse: []},
             %Combo{for_success: [:winter, :lantern, :grail], for_no_curse: []}
           ]) == [
             %Combo{
               for_success: [
                 :grail,
                 %Choice{list: [:forge, :winter]},
                 %Choice{list: [:knock, :lantern]}
               ],
               for_no_curse: []
             }
           ]
  end
end
