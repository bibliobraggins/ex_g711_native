defmodule G7XXTest do
  use ExUnit.Case
  doctest G7XX.Native

  test "compress a single i16 to a ulaw companded u8" do
    companded_u8 = 15 # 0x0f # 0b00001111 # <<15::8>>

    # need to triple check if this conversion is correct.
    # I get consistent values, that doesn't mean the quantization is correct until I prove it.

    for i <- -17275..-16252 do
      assert G7XX.Native.linear_to_ulaw(i) == companded_u8
    end
  end
end
