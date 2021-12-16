defmodule Asada.MixProject do
  use Mix.Project

  def project do
    [
      app: :asada,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  def releases do
    [
      asada: [
        steps: [:assemble, &Burrito.wrap/1],
        burrito: [
          targets: [:darwin, :win64, :linux, :linux_musl]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Asada.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps() do
    [
      {:burrito, github: "burrito-elixir/burrito"}
    ]
  end
end
