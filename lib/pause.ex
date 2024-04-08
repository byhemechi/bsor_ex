defmodule BSOR.PauseArray do
  defstruct [:count, :pauses]

  def decode(file) do
    count = file |> BSOR.Data.decode_int()

    %__MODULE__{count: count, pauses: decode_pauses(file, count)}
  end

  defp decode_pauses(file, remaining_frames, frames \\ []) do
    case remaining_frames do
      0 -> frames |> Enum.reverse()
      _ -> [BSOR.Height.decode(file) | decode_pauses(file, remaining_frames - 1, frames)]
    end
  end
end

defmodule BSOR.Pause do
  defstruct [:duration, :time]

  def decode(file) do
    %__MODULE__{
      duration: file |> BSOR.Data.decode_float(),
      time: file |> BSOR.Data.decode_float()
    }
  end
end
