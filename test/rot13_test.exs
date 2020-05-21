defmodule Rot13Test do
  use ExUnit.Case

  describe "convert/1" do
    test "alphabet conversion" do
      assert "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm" ==
               Rot13.convert("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
    end

    test "multibyte characters are passed through" do
      assert "üsb çué" == Rot13.convert("üfo çhé")
    end
  end

  describe "convert_tr/2" do
    test "alphabet conversion" do
      assert "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm" ==
               Rot13.convert_tr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", "")
    end

    test "multibyte characters are passed through" do
      assert "üsb çué" == Rot13.convert_tr("üfo çhé", "")
    end
  end
end
