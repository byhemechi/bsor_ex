defmodule BSOR.WallArray do
  defstruct [:count, :walls]

  def decode(file) do
    count = file |> BSOR.Data.decode_int()

    %__MODULE__{count: count, walls: decode_walls(file, count)}
  end

  defp decode_walls(file, remaining_frames, frames \\ []) do
    case remaining_frames do
      0 -> frames |> Enum.reverse()
      _ -> [BSOR.Wall.decode(file) | decode_walls(file, remaining_frames - 1, frames)]
    end
  end
end

defmodule BSOR.Wall do
  defstruct [:id, :energy, :time, :spawn_time]

  def decode(file) do
    %__MODULE__{
      id: file |> BSOR.Data.decode_int(),
      energy: file |> BSOR.Data.decode_float(),
      time: file |> BSOR.Data.decode_float(),
      spawn_time: file |> BSOR.Data.decode_float()
    }
  end
end
