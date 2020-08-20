defmodule ShipitApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :shipit_api,
      description: "This hex package allows to connect with Shipit API",
      version: "0.1.0",
      elixir: "~> 1.10",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:jason, ">= 1.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [c: "compile"]
  end

  defp package do
    [
      maintainers: ["hiro-riveros"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/hiro-riveros/elixir-shipit-api"}
    ]
  end
end
