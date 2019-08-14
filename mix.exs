defmodule Hjson.MixProject do
  use Mix.Project

  def project do
    [
      app: :hjson,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["zerosign"],
      links: %{"GitHub" => "https://github.com/zerosign/hjson"}
    }

  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_parsec, git: "https://github.com/plataformatec/nimble_parsec", branch: "master"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
