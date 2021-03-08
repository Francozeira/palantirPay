defmodule PalantirpayWeb.UsersController do
  use PalantirpayWeb, :controller

  alias Palantirpay.User

  def create(conn, params) do
    params
    |> Palantirpay.create_user()
    |> handleResponse(conn)

  end

  defp handleResponse({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handleResponse({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
