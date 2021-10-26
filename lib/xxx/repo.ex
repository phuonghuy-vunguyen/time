defmodule Xxx.Repo do
  use Ecto.Repo,
    otp_app: :xxx,
    adapter: Ecto.Adapters.Postgres
end
