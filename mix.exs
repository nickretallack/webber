defmodule Webber.Mixfile do
  use Mix.Project

  def project do
    [app: :webber,
     version: "0.0.1",
     elixir: "~> 0.15.1",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:ewebmachine],
     mod: {Webber, []}]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:ewebmachine,"~> 1.0.0", github: "awetzel/ewebmachine"}]
    # [{:ewebmachine, "~> 1.0.0"}]
  end
end
