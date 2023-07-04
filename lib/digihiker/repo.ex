defmodule Digihiker.Repo do
  use Ecto.Repo,
    otp_app: :digihiker,
    adapter: Ecto.Adapters.Postgres
end
