defmodule Popcorn.Repo do
  use Ecto.Repo,
    otp_app: :popcorn,
    adapter: Ecto.Adapters.Postgres
end
