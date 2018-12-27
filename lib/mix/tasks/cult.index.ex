defmodule Mix.Tasks.Cult.Index do
  use Mix.Task
  import Cultulator.Mix

  defmodule Generator do
    use Eml.HTML

    def html_page do
      root()
      |> Eml.compile()
    end

    defp root do
      html do
        head do
          title("Cultist Simulator Reference Data")
          link(rel: :stylesheet, type: "text/css", href: "css/main.css")
        end

        Cultulator.Html.layout do
          div id: :container do
            h1("Navigation")

            ul do
              li do
                a([href: "expeditions.html"], "Expeditions / Vaults")
              end
            end
          end
        end
      end
    end
  end

  def run([]), do: generate_page()

  def run(_) do
    Mix.raise("cult.index does not accept arguments")
  end

  defp generate_page do
    Mix.Task.run("cult.css")
    write_file(build_path("index.html"), Generator.html_page())
  end
end
