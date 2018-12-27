defmodule Cultulator.Mix do
  require Logger

  def build_path(path) do
    Path.join([Mix.Project.build_path(), "pages", path])
  end

  def relative(path) do
    Path.relative_to_cwd(path)
  end

  def write_file(contents, target) do
    rm!(target)
    File.write!(target, contents)
    Logger.info("Wrote #{byte_size(contents)} bytes to #{relative(target)}")
  end

  def copy_static(source, target) do
    Path.dirname(target) |> File.mkdir_p!()
    src_stat = File.stat!(source)

    case File.stat(target) do
      {:error, :enoent} ->
        rm!(target)
        File.copy!(source, target)
        Logger.info("Copied: #{source} -> #{relative(target)}")

      {:ok, ^src_stat} ->
        Logger.info("Keeping link: #{source} -> #{relative(target)}")

      {:ok, %File.Stat{type: :regular}} ->
        rm!(target)
        File.copy!(source, target)
        Logger.info("Copied: #{source} -> #{relative(target)}")

      {:ok, _} ->
        raise "Target #{relative(target)} is not a file or a link to #{source}"
    end
  end

  def rm!(file) do
    case File.rm(file) do
      :ok -> :ok
      {:error, :enoent} -> :ok
      {:error, err} -> raise "Failed to delete #{file}: #{inspect(err)}"
    end
  end
end
