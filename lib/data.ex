defmodule BSOR.Data do
  def decode_byte(file) do
    file |> IO.binread(1)
  end

  def decode_int(file) do
    <<number::little-unsigned-size(32)>> = file |> IO.binread(4)
    number
  end

  def decode_float(file) do
    <<number::float-little-unsigned-size(32)>> = file |> IO.binread(4)
    number
  end

  def decode_boolean(file) do
    <<value::8>> = file |> IO.binread(1)
    value == 1
  end

  def decode_string(file) do
    <<size::little-unsigned-size(32)>> = file |> IO.binread(4)
    file |> IO.binread(size)
  end

  def decode_vec3(file) do
    {file |> BSOR.Data.decode_float(), file |> BSOR.Data.decode_float(),
     file |> BSOR.Data.decode_float()}
  end

  def decode_vec4(file) do
    {file |> BSOR.Data.decode_float(), file |> BSOR.Data.decode_float(),
     file |> BSOR.Data.decode_float(), file |> BSOR.Data.decode_float()}
  end
end
