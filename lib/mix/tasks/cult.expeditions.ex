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

  defp build_path(path) do
    Path.join([Mix.Project.build_path(), "pages", path])
  end

  defp relative(path) do
    Path.relative_to_cwd(path)
  end

  defp generate_page do
    copy_static("static/css/expeditions.css", build_path("css/expeditions.css"))
    write_file(build_path("expeditions.html"), Generator.html_page())
  end

  defp write_file(target, contents) do
    File.rm!(target)
    File.write!(target, contents)
    IO.puts("* Wrote #{byte_size(contents)} bytes to #{relative(target)}")
  end

  defp copy_static(source, target) do
    Path.dirname(target) |> File.mkdir_p!()
    src_stat = File.stat!(source)

    case File.stat(target) do
      {:error, :enoent} ->
        File.rm!(target)
        File.copy!(source, target)
        IO.puts("* Copied: #{source} -> #{relative(target)}")

      {:ok, ^src_stat} ->
        IO.puts("* Keeping link: #{source} -> #{relative(target)}")

      {:ok, %File.Stat{type: :regular}} ->
        File.rm!(target)
        File.copy!(source, target)
        IO.puts("* Copied: #{source} -> #{relative(target)}")

      {:ok, _} ->
        raise "Target #{relative(target)} is not a file or a link to #{source}"
    end
  end
end
