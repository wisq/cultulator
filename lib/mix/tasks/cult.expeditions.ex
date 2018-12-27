defmodule Mix.Tasks.Cult.Expeditions do
  use Mix.Task

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
          link(rel: :stylesheet, type: "text/css", href: "css/expeditions.css")
        end

        body do
          vault_table()
        end
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
    copy_static("static/css/expeditions.css", "pages/css/expeditions.css")
    File.write!("pages/expeditions.html", Generator.html_page())
  end

  defp copy_static(source, target) do
    Path.dirname(target) |> File.mkdir_p!()
    src_stat = File.stat!(source)

    case File.stat(target) do
      {:error, :enoent} -> File.copy!(source, target)
      {:ok, ^src_stat} -> :ok
      _ -> raise "Target #{target} exists and is not a link to #{source}"
    end
  end
end
