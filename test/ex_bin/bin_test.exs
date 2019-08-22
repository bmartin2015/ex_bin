defmodule ExBin.BinTest do
  use ExUnit.Case
  use ExUnitProperties

  alias ExBin.Bin

  describe "new/1" do
    test "returns default %Bin{} with no options" do
      assert %Bin{name: "No Name", private: false} = Bin.new()
    end

    property "returns named %Bin{} with options" do
      check all name <- string(:printable),
        private <- boolean() do

          opts = [name: name, private: private]
          assert %Bin{name: ^name, private: ^private} = Bin.new(opts)
        end
    end
  end
end
