defmodule BSOR.Transform do
  defstruct position: {0, 0, 0},
            rotation: {0, 0, 0, 0}

  def decode(file) do
    %__MODULE__{
      position: BSOR.Data.decode_vec3(file),
      rotation: BSOR.Data.decode_vec4(file)
    }
  end
end
