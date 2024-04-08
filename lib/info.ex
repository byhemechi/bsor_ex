defmodule BSOR.Info do
  defstruct [
    :mod_version,
    :game_version,
    :timestamp,
    :player_id,
    :player_name,
    :platform,
    :tracking_system,
    :hmd,
    :controller,
    :hash,
    :song_name,
    :mapper,
    :difficulty,
    :score,
    :mode,
    :environment,
    :modifiers,
    :jump_distance,
    :left_handed?,
    :height,
    :start_time,
    :fail_time,
    :speed
  ]

  def decode(file) do
    %__MODULE__{
      # Basic metadata
      mod_version: file |> BSOR.Data.decode_string(),
      game_version: file |> BSOR.Data.decode_string(),
      timestamp: file |> BSOR.Data.decode_string(),

      # Player info
      player_id: file |> BSOR.Data.decode_string(),
      player_name: file |> BSOR.Data.decode_string(),
      platform: file |> BSOR.Data.decode_string(),

      # Headset info
      tracking_system: file |> BSOR.Data.decode_string(),
      hmd: file |> BSOR.Data.decode_string(),
      controller: file |> BSOR.Data.decode_string(),

      # Map info
      hash: file |> BSOR.Data.decode_string(),
      song_name: file |> BSOR.Data.decode_string(),
      mapper: file |> BSOR.Data.decode_string(),
      difficulty: file |> BSOR.Data.decode_string(),

      # Score info
      score: file |> BSOR.Data.decode_int(),
      mode: file |> BSOR.Data.decode_string(),
      environment: file |> BSOR.Data.decode_string(),
      modifiers:
        case file |> BSOR.Data.decode_string() |> String.split(",") do
          [""] -> nil
          modifiers -> modifiers
        end,
      jump_distance: file |> BSOR.Data.decode_float(),
      left_handed?: file |> BSOR.Data.decode_boolean(),
      height: file |> BSOR.Data.decode_float(),

      # Practice mode
      start_time: file |> BSOR.Data.decode_float(),
      fail_time: file |> BSOR.Data.decode_float(),
      speed: file |> BSOR.Data.decode_float()
    }
  end
end
