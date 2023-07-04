defmodule Digihiker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DigihikerWeb.Telemetry,
      # Start the Ecto repository
      Digihiker.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Digihiker.PubSub},
      # Start Finch
      {Finch, name: Digihiker.Finch},
      # Start the Endpoint (http/https)
      DigihikerWeb.Endpoint
      # Start a worker by calling: Digihiker.Worker.start_link(arg)
      # {Digihiker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Digihiker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DigihikerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
