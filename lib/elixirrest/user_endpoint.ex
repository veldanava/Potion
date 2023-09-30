defmodule Elixirrest.UserEndpoint do
  @moduledoc """
  User Model:
  {
    "username": "kiana dimitri",
    "password": "12345",
    "lastName": "dimitri",
    "firstName": "kiana",
    "email": "kianakasulana@admin.net",
  }
  """
  use Plug.Router

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)
  get "/users" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{response: "hello elixir"}))
  end

  match _ do
    send_resp(conn, 404, "request not found")
  end
end
