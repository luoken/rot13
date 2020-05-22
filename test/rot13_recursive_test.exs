defmodule Rot13RecursiveTest do
  use ExUnit.Case

  describe "convert/1" do
    test "alphabet conversion" do
      assert "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm" ==
               Rot13Recursive.convert("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
    end

    test "multibyte characters are passed through" do
      assert "üsb çué" == Rot13Recursive.convert("üfo çhé")
    end
  end
end
