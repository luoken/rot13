defmodule Rot13 do
  @moduledoc """
  Rot13 is a cipher that simply rotates 13 places.
  """

  @doc """
    `convert/1` will take in a string and return a string that has been rotated 13 places.

  ## Examples

      iex> Rot13.convert("hello")
      "uryyb"

  """
  @spec convert(string :: String.t()) :: String.t()
  def convert(string) do
    String.to_charlist(string)
    |> Enum.map(fn x -> handle_codepoint(x) end)
    |> List.to_string()
  end

  @spec handle_codepoint(codepoint :: char) :: char
  def handle_codepoint(codepoint) do
    cond do
      (codepoint >= 65 and codepoint <= 77) or (codepoint >= 97 and codepoint <= 109) ->
        codepoint + 13

      (codepoint >= 78 and codepoint <= 90) or (codepoint >= 110 and codepoint <= 122) ->
        codepoint - 13

      true ->
        codepoint
    end
  end
end
