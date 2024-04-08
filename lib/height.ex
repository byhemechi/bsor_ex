defmodule BSOR.HeightArray do
  defstruct [:count, :heights]

  def decode(file) do
    count = file |> BSOR.Data.decode_int()

    %__MODULE__{count: count, heights: decode_heights(file, count)}
  end

  defp decode_heights(file, remaining_frames, frames \\ []) do
    case remaining_frames do
      0 -> frames |> Enum.reverse()
      _ -> [BSOR.Height.decode(file) | decode_heights(file, remaining_frames - 1, frames)]
    end
  end
end

defmodule BSOR.Height do
  defstruct [:height, :time]

  def decode(file) do
    %__MODULE__{
      height: file |> BSOR.Data.decode_float(),
      time: file |> BSOR.Data.decode_float()
    }
  end
end
