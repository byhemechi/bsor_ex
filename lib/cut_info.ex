defmodule BSOR.CutInfo do
  defstruct speed_ok?: false,
            direction_ok?: false,
            saber_type_ok?: false,
            was_cut_too_soon?: false,
            saber_speed: 0.0,
            saber_direction: {0.0, 0.0, 0.0},
            saber_type: 0,
            time_deviation: 0.0,
            cut_dir_deviation: 0.0,
            cut_point: {0.0, 0.0, 0.0},
            cut_normal: {0.0, 0.0, 0.0},
            cut_distance: 0.0,
            cut_angle: 0.0,
            before_cut: 0.0,
            after_cut: 0.0

  def decode(file) do
    %__MODULE__{
      speed_ok?: BSOR.Data.decode_boolean(file),
      direction_ok?: BSOR.Data.decode_boolean(file),
      saber_type_ok?: BSOR.Data.decode_boolean(file),
      was_cut_too_soon?: BSOR.Data.decode_boolean(file),
      saber_speed: BSOR.Data.decode_float(file),
      saber_direction: BSOR.Data.decode_vec3(file),
      saber_type: BSOR.Data.decode_int(file),
      time_deviation: BSOR.Data.decode_float(file),
      cut_dir_deviation: BSOR.Data.decode_float(file),
      cut_point: BSOR.Data.decode_vec3(file),
      cut_normal: BSOR.Data.decode_vec3(file),
      cut_distance: BSOR.Data.decode_float(file),
      cut_angle: BSOR.Data.decode_float(file),
      before_cut: BSOR.Data.decode_float(file),
      after_cut: BSOR.Data.decode_float(file)
    }
  end
end
