defmodule Notifications.MixProject do
  use Mix.Project

  def project do
    [
      app: :notifications,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Notifications.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto_sql, "~> 3.7"},
      {:postgrex, "~> 0.15"}
    ]
  end
end
