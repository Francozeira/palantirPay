defmodule Palantirpay.Users.Create do
  alias Palantirpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
