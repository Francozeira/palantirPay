defmodule PalantirpayWeb.UsersViewTest do

  use PalantirpayWeb.ConnCase, async: true
  import Phoenix.View

  alias Palantirpay.{Account, User}
  alias PalantirpayWeb.UsersView

  test "render create.json" do
    params = %{
      name: "Leo",
      password: "123456",
      nickname: "francozeira",
      email: "leo@tt.com",
      age: 27,
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Palantirpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id,
          },
        id: user_id,
        name: "Leonardo",
        nickname: "francozeira",
      }

    }

    assert expected_response == response
  end

end
