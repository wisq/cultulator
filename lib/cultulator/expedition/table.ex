defmodule Cultulator.Expedition.Table do
  use Eml.HTML

  alias Cultulator.Expedition.{Solver, Combiner}
  # alias Cultulator.Expedition.Solver.Combo
  alias Cultulator.Expedition.Combiner.Choice

  def generate(vaults) do
    table do
      header_row()

      vaults
      |> Enum.sort_by(&vault_sort_key/1)
      |> Enum.map(&vault_row/1)
    end
  end

  defp header_row do
    tr class: :header do
      th([class: :name], "Vault name")
      th([class: :level], tooltip("SH", "Secret Histories level"))
      th([class: :repeatable], tooltip("R", "Repeatable"))
      th([class: :hazards], "Hazards")

      th([class: :aspects], [
        "Minimum required & ",
        span([class: :optional], "optional"),
        " aspects"
      ])
    end
  end

  defp vault_row(vault) do
    tr class: :vault do
      td([class: :name], db_link(vault.name, vault.card_id))
      td([class: :level], vault.history_level || tooltip("S", "Special"))
      td([class: :repeatable], render_boolean(vault.repeatable))

      td class: :hazards do
        vault.hazards
        |> Enum.sort_by(&hazard_sort_key/1)
        |> Enum.map(&render_hazard/1)
      end

      td class: :aspects do
        vault
        |> Solver.solve()
        |> Combiner.combine()
        |> Enum.map(&render_solution/1)
      end
    end
  end

  defp vault_sort_key(vault) do
    {vault.history_level, vault.repeatable, vault.name}
  end

  defp hazard_sort_key(hazard) do
    {hazard.curse, hazard.name}
  end

  defp render_hazard(hazard) do
    type = if hazard.curse, do: :curse, else: :blocker

    div class: "hazard #{type}" do
      span([class: :name], hazard.name)

      span([class: :aspects], [
        " (",
        hazard.aspects
        |> Enum.sort()
        |> Enum.map(&render_aspect(&1, :short))
        |> Enum.intersperse("/"),
        ")"
      ])
    end
  end

  defp render_solution(combo) do
    div class: :solution do
      [
        required: combo.for_success,
        optional: combo.for_no_curse
      ]
      |> Enum.flat_map(fn {type, aspects} ->
        Enum.map(aspects, &render_aspect(&1, type))
      end)
      |> Enum.intersperse(" + ")
    end
  end

  defp render_aspect(%Choice{list: aspects}, type) do
    choice =
      aspects
      |> Enum.map(&render_aspect(&1, type))
      |> Enum.intersperse(" or ")

    span([class: "choice #{type}"], ["[", choice, "]"])
  end

  defp render_aspect(aspect, type) when is_atom(aspect) do
    name =
      aspect
      |> Atom.to_string()
      |> String.capitalize()

    span(
      [class: "aspect a_#{aspect} #{type}"],
      if type == :short do
        String.first(name)
      else
        name
      end
    )
  end

  defp render_boolean(true), do: span([class: :bool_true], {:safe, "&#x2713;"})
  defp render_boolean(false), do: span([class: :bool_false], {:safe, "&ndash;"})

  defp tooltip(text, help_text) do
    div class: :tooltip do
      text
      span([class: :tooltiptext], help_text)
    end
  end

  defp db_link(text, id) do
    a([href: db_url(id), class: "dblink"], text)
  end

  @db_uri URI.parse("https://www.frangiclave.net/")

  defp db_url(id) do
    %URI{@db_uri | path: "/element/#{id}/"}
    |> URI.to_string()
  end
end
