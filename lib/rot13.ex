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

  def convert_tr(<<head::utf8, tail::binary>>, acc) do
    convert_tr(tail, acc ++ [handle_codepoint(head)])
  end

  def convert_tr(<<>>, acc) do
    List.to_string(acc)
  end

  @spec handle_codepoint(codepoint :: char) :: char
  def handle_codepoint(codepoint)
      when (codepoint >= ?A and codepoint <= ?M) or (codepoint >= ?a and codepoint <= ?m),
      do: codepoint + 13

  def handle_codepoint(codepoint)
      when (codepoint >= ?N and codepoint <= ?Z) or (codepoint >= ?n and codepoint <= ?z),
      do: codepoint - 13

  def handle_codepoint(codepoint), do: codepoint
end
