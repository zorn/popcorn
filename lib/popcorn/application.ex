defmodule Popcorn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PopcornWeb.Telemetry,
      # Start the Ecto repository
      Popcorn.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Popcorn.PubSub},
      # Start Finch
      {Finch, name: Popcorn.Finch},
      # Start the Endpoint (http/https)
      PopcornWeb.Endpoint
      # Start a worker by calling: Popcorn.Worker.start_link(arg)
      # {Popcorn.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Popcorn.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PopcornWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
