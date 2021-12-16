defmodule Asada.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Asada.Worker.start_link(arg)
      Supervisor.child_spec({Asada.Worker, {"Asada", 2}}, id: :asada),
      Supervisor.child_spec({Asada.Worker, {"Pollo", 3}}, id: :burrito),
      Supervisor.child_spec({Asada.Worker, {"Carnitas", 5}}, id: :carnitas)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Asada.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
