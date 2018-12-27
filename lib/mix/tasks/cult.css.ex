defmodule Mix.Tasks.Cult.Css do
  use Mix.Task
  import Cultulator.Mix

  def run([]) do
    copy_static("static/css/main.css", build_path("css/main.css"))
  end

  def run(_) do
    Mix.raise("cult.css does not accept arguments")
  end
end
