defmodule PalantirpayWeb.AccountsController do
  use PalantirpayWeb, :controller

  alias Palantirpay.Account

  action_fallback PalantirpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Palantirpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)

    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Palantirpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)

    end
  end
end
