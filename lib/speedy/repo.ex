defmodule Speedy.Repo do
  use Ecto.Repo,
    otp_app: :speedy,
    adapter: Ecto.Adapters.Postgres
end
