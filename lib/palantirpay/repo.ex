defmodule Palantirpay.Repo do
  use Ecto.Repo,
    otp_app: :palantirpay,
    adapter: Ecto.Adapters.Postgres
end
