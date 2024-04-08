defmodule Bsor.MixProject do
  use Mix.Project

  def project do
    [
      app: :bsor,
      version: "0.1.0",
      elixir: "~> 1.16",
      description: "Elixir parser for BeatLeader replays",
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end


  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/byhemechi/bsor_ex"}
    ]
  end
end
