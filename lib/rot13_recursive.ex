defmodule Rot13Recursive do
  @moduledoc """
  Recursive way of doing the Rot13 cipher.
  """
  def convert(string) do
    string
    |> rot_cipher("")
  end

  defp rot_cipher(<<head, tail::binary>>, acc)
      when (head >= ?A and head <= ?M) or (head >= ?a and head <= ?m),
      do: rot_cipher(tail, acc <> <<head + 13>>)

  defp rot_cipher(<<head, tail::binary>>, acc)
      when (head >= ?N and head <= ?Z) or (head >= ?m and head <= ?z),
      do: rot_cipher(tail, acc <> <<head - 13>>)

  defp rot_cipher(<<head, tail::binary>>, acc), do: rot_cipher(tail, acc <> <<head>>)

  defp rot_cipher("", acc) do
    acc
  end
end
