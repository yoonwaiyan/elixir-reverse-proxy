defmodule ReverseProxy.Mixfile do
  use Mix.Project

  def project do
    [app: :reverse_proxy,
     version: "0.3.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     deps: deps(),
     name: "ReverseProxy",
     description: description(),
     package: package(),
     docs: [readme: "README.md", main: "README"],
     test_coverage: [tool: ExCoveralls]]
  end

  def application do
    [applications: [:logger, :plug, :cowboy, :httpoison],
     mod: {ReverseProxy, []}]
  end

  defp deps do
    [{:plug, "~> 1.1.6"},
     {:cowboy, "~> 1.0.2"},
     {:httpoison, "~> 0.9"},

     {:earmark, "~> 1.0", only: :dev},
     {:ex_doc, "~> 0.14", only: :dev},

     {:credo, "~> 0.5", only: [:dev, :test]},
     {:excoveralls, "~> 0.5", only: :test},
     {:dialyze, "~> 0.2", only: :test}]
  end

  defp description do
    """
    A Plug based reverse proxy server.
    """
  end

  defp package do
    %{maintainers: ["Shane Logsdon"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/slogsdon/elixir-reverse-proxy"}}
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]
end
