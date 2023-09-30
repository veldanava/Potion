defmodule Elixirrest.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Elixirrest.UserEndpoint,
        options: Application.get_env(:elixirrest,:endpoint)[:port]
      ),
    ]

    opts = [
      strategy: :one_for_one,
      name: Elixirrest.Supervisor
    ]
    Supervisor.start_link(children, opts)
  end
end
