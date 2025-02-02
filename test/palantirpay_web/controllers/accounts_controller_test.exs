defmodule Palantirpay.AccountsControllerTest do
  use PalantirpayWeb.ConnCase, async: true

  alias Palantirpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Leo",
        password: "123456",
        nickname: "francozeira",
        email: "leo@tt.com",
        age: 27,
      }

      {:ok, %User{account: %Account{id: account_id}}} = Palantirpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic YmFuYW5h0m5hbmljYTEyMw==" )

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params =%{"value" => "69.69"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, :account_id, params))
        |> json_response(:ok)

        assert %{
          "account" => %{"account" => "69.69","id" => _id},
          "message" => "Balance changes successfully"
        } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params =%{"value" => "biruleibe"}
      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, :account_id, params))
        |> json_response(:bad_request)

        expected_response = %{"message" => "Invalid deposit value"}

        assert response == expected_response
    end

  end

end
