defmodule PalantirpayWeb.WelcomeController do
  use PalantirpayWeb, :controller

  alias Palantirpay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handleResponse(conn)

  end

  defp handleResponse({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Palantirpay API. Here is your number #{result}"})
  end

  defp handleResponse({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
