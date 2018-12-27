defmodule Cultulator.Mining.Util do
  def shorten("The " <> rest), do: rest
  def shorten("A " <> rest), do: rest
  def shorten(other), do: other
end
