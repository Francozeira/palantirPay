defmodule Palantirpay do
  alias Palantirpay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
