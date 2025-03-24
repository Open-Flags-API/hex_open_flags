defmodule OpenFlags.MixProject do
  use Mix.Project

  def project do
    [
      app: :open_flags,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Static SVG flags for ISO 3166 regions.",
      package: package(),
      name: "OpenFlags",
      source_url: "https://github.com/shyaboi/hex_open_flags",
      homepage_url: "https://openflags.net",
      docs: [
        main: "OpenFlags",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "hex_open_flags",
      licenses: ["GPL-3.0"],
      maintainers: ["Shyaboi"],
      links: %{"GitHub" => "https://github.com/shyaboi/hex_open_flags"},
      files: ~w(lib priv mix.exs README.md LICENSE)
    ]
  end
end
