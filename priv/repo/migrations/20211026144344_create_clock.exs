defmodule Xxx.Repo.Migrations.CreateClock do
  use Ecto.Migration

  def change do
    create table(:clock) do
      add :time, :naive_datetime
      add :status, :boolean, default: false, null: false

      timestamps()
    end
  end
end
