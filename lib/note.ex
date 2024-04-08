defmodule BSOR.NoteArray do
  defstruct [:count, :notes]

  def decode(file) do
    count = file |> BSOR.Data.decode_int()

    %__MODULE__{count: count, notes: decode_notes(file, count)}
  end

  defp decode_notes(file, remaining_frames, frames \\ []) do
    case remaining_frames do
      0 -> frames |> Enum.reverse()
      _ -> [BSOR.Note.decode(file) | decode_notes(file, remaining_frames - 1, frames)]
    end
  end
end

defmodule BSOR.Note do
  defstruct [:id, :event_time, :spawn_time, :event]

  def decode(file) do
    %__MODULE__{
      id: file |> BSOR.Data.decode_int(),
      event_time: file |> BSOR.Data.decode_float(),
      spawn_time: file |> BSOR.Data.decode_float(),
      event:
        case file |> BSOR.Data.decode_int() do
          0 -> {:good, BSOR.CutInfo.decode(file)}
          1 -> {:bad, BSOR.CutInfo.decode(file)}
          2 -> {:miss, nil}
          3 -> {:bomb, nil}
        end
    }
  end
end
