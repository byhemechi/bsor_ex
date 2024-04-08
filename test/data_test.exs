defmodule BSORTest.DataTest do
  use ExUnit.Case
  doctest BSOR.Data

  test "decode_int" do
    {:ok, file} = StringIO.open(<<0xD2040000::size(32)>>)
    assert BSOR.Data.decode_int(file) == 1234
  end

  test "decode_float" do
    {:ok, file} = StringIO.open(<<0x00499A44::size(32)>>)
    assert BSOR.Data.decode_float(file) == 1234.28125
  end
end
