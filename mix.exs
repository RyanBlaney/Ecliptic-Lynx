defmodule EclipticLynx.MixProject do
  use Mix.Project

  def project do
    in_production = Mix.env() == :prod

    [
      app: :ecliptic_lynx,
      version: "0.1.0",
      elixir: "~> 1.16.3",
      deps: deps(),
      escript: escript(),
      build_embedded: in_production
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.4.1"}
    ]
  end

  defp escript do
    [main_module: EclipticLynx.CLI]
  end
end
