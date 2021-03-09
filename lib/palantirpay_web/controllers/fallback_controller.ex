defmodule PalantirpayWeb.FallbackController do
  use PalantirpayWeb, :controller

  alias Palantirpay.User

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(PalantirpayWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
