defmodule Cultulator.Mining.GameData do
  require Logger

  @recipe_path "data/StreamingAssets/content/core/recipes"

  defp recipe_files(filter_fn) do
    File.ls!(@recipe_path)
    |> Enum.filter(&(&1 =~ ~r{^[a-z].*\.json$}))
    |> Enum.filter(filter_fn)
    |> Enum.map(&Path.join(@recipe_path, &1))
  end

  def obstacles do
    recipe_files(&String.starts_with?(&1, "explore_obstacles_"))
    |> Enum.map(&parse_json_file/1)
    |> Enum.flat_map(& &1.recipes)
    |> Map.new(&{&1.id, &1})
  end

  def explore_vaults do
    recipe_files(&String.starts_with?(&1, "explore_vaults_"))
    |> Enum.map(&parse_json_file/1)
    |> Enum.flat_map(& &1.recipes)
    |> Map.new(&{&1.id, &1})
  end

  def explore_secret_histories do
    parse_json_file("data/StreamingAssets/content/core/recipes/explore_secrethistories.json")
    |> Map.fetch!(:recipes)
    |> Map.new(&{&1.id, &1})
  end

  def deck(name) do
    parse_json_file("data/StreamingAssets/content/core/decks/#{name}.json")
    |> Map.fetch!(:decks)
    |> Map.new(&{&1.id, &1})
  end

  def elements(name) do
    parse_json_file("data/StreamingAssets/content/core/elements/#{name}.json")
    |> Map.fetch!(:elements)
    |> Map.new(&{&1.id, &1})
  end

  def fragments do
    parse_json_file("data/StreamingAssets/content/core/elements/fragments.json", fn data ->
      data
      |> String.replace(~r/{epiphany:([a-z]+)}/, "{epiphany:\"\\1\"}")
    end)
    |> Map.fetch!(:elements)
    |> Map.new(&{&1.id, &1})
  end

  def vaults do
    parse_json_file("data/StreamingAssets/content/core/elements/vaults.json")
    |> Map.fetch!(:elements)
    |> Map.new(&{&1.id, &1})
  end

  def vault_locks do
    parse_json_file("data/StreamingAssets/content/core/elements/vault_locks.json")
    |> Map.fetch!(:elements)
    |> Map.new(&{&1.id, &1})
  end

  defp parse_json_file(f, preprocess_fn \\ fn x -> x end) do
    Logger.info("Parsing JSON file: #{f}")

    data =
      File.read!(f)
      |> String.trim()
      |> String.trim_trailing(";")
      |> preprocess_fn.()

    path = Briefly.create!()
    File.write!(path, data)

    case System.cmd("json5", [path]) do
      # Normally, you should never do `keys: :atoms`
      # because you can flood the atom table.
      # However, this is a short-lived script,
      # so it's acceptable, and rather convenient.
      {str, 0} -> Poison.decode!(str, keys: :atoms)
      {_, code} -> raise "json5 exited with code #{code}"
    end
  end
end
