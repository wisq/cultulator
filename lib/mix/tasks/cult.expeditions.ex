defmodule Mix.Tasks.Cult.Expeditions do
  use Mix.Task
  import Cultulator.Mix

  defmodule Generator do
    use Eml.HTML

    alias Cultulator.Expedition.{Data, Table}

    def html_page do
      root()
      |> Eml.compile()
    end

    defp root do
      html do
        head do
          title("Cultist Simulator Expeditions Reference Table")
          link(rel: :stylesheet, type: "text/css", href: "css/main.css")
          link(rel: :stylesheet, type: "text/css", href: "css/expeditions.css")
        end

        Cultulator.Html.layout do
          [page_header(), vault_table()]
        end
      end
    end

    defp page_header do
      div id: :container do
        h1("Expedition Locations")
      end
    end

    defp vault_table do
      Data.vaults()
      |> Table.generate()
    end
  end

  def run([]), do: generate_page()

  def run(_) do
    Mix.raise("cult.expeditions does not accept arguments")
  end

  defp generate_page do
    Mix.Task.run("cult.css")
    copy_static("static/css/expeditions.css", build_path("css/expeditions.css"))
    write_file(build_path("expeditions.html"), Generator.html_page())
  end
end
