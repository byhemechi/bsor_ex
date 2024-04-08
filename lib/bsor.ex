defmodule BSOR do
  @moduledoc """
    BS Open Replay format parser
  """

  defp decode_chunk(<<0>>, file), do: BSOR.Info.decode(file)
  defp decode_chunk(<<1>>, file), do: BSOR.FrameArray.decode(file)
  defp decode_chunk(<<2>>, file), do: BSOR.NoteArray.decode(file)
  defp decode_chunk(<<3>>, file), do: BSOR.WallArray.decode(file)
  defp decode_chunk(<<4>>, file), do: BSOR.HeightArray.decode(file)
  defp decode_chunk(<<5>>, file), do: BSOR.PauseArray.decode(file)
  defp decode_chunk(type, file), do: nil

  defp decode_events(file, chunks \\ []) do
    type = IO.binread(file, 1)

    case type do
      :eof -> chunks |> Enum.reverse()
      _ -> decode_events(file, [decode_chunk(type, file) | chunks])
    end
  end

@doc """
  Decodes
  """
  def decode_replay(path) do
    file = File.open!(path)

    magic_number = file |> BSOR.Data.decode_int()

    if(magic_number != 0x442d3d69, do: raise "Invalid magic number")

    version = file |> BSOR.Data.decode_byte()

    %{
      version: version,
      chunks: decode_events(file)
    }
  end
end
