defmodule Scentenced.Repo do
  use Ecto.Repo,
    otp_app: :scentenced,
    adapter: Ecto.Adapters.Postgres
end
