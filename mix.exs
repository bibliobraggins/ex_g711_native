defmodule G7xxNative.MixProject do

use Mix.Project

  @version "0.1.0"
  @github_url "https://github.com/bibliobraggins/g7xx_plugin"

  def project do
    [
      app: :g7xx_native,
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_env), do: ["lib"]

  defp deps do
    [
      {:rustler, "~> 0.26.0"},
    ]
  end

end
