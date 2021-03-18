defmodule Palantirpay do
  alias Palantirpay.Users.Create, as: UserCreate
  alias Palantirpay.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
