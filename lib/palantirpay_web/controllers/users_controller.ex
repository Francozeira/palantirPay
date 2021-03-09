defmodule PalantirpayWeb.UsersController do
  use PalantirpayWeb, :controller

  alias Palantirpay.User

  action_fallback PalantirpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Palantirpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)

    end
  end
end
