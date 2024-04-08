defmodule BSOR.FrameArray do
  defstruct [:count, :frames]

  def decode(file) do
    count = file |> BSOR.Data.decode_int()

    %__MODULE__{count: count, frames: decode_frames(file, count)}
  end

  defp decode_frames(file, remaining_frames, frames \\ []) do
    case remaining_frames do
      0 -> frames |> Enum.reverse()
      _ -> [BSOR.Frame.decode(file) | decode_frames(file, remaining_frames - 1, frames)]
    end
  end
end

defmodule BSOR.Frame do
  defstruct time: 0.0,
            fps: 0,
            head: %BSOR.Transform{},
            left_hand: %BSOR.Transform{},
            right_hand: %BSOR.Transform{}

  def decode(file) do
    %__MODULE__{
      time: file |> BSOR.Data.decode_float(),
      fps: file |> BSOR.Data.decode_int(),
      head: file |> BSOR.Transform.decode(),
      left_hand: file |> BSOR.Transform.decode(),
      right_hand: file |> BSOR.Transform.decode()
    }
  end
end
