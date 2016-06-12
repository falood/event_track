defmodule EventTrack.Mixfile do
  use Mix.Project

  def project do
    [app: :event_track,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :maru, :ecto, :mongodb_ecto],
      mod: {EventTrack, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:maru, "~> 0.9.6"},
      {:poison, "~> 2.0", override: true},
      {:cors_plug, "~> 1.1.1"},
      {:ecto, "~> 1.0.7", override: true},
      {:exrm, "~> 1.0.5"},
      {:mongodb_ecto, "~> 0.1.4"}
    ]
  end

  defp description do
    """
    Record any actions your system perform, along with any properties that describe the action
    """
  end

  defp package do
    [maintainers: ["Rafael Jesus"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/rafaeljesus/event_track"},
     files: ~w(mix.exs README.md lib)]
  end
end
