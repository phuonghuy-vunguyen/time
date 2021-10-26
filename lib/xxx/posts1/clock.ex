defmodule Xxx.Posts1.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clock" do
    field :status, :boolean, default: false
    field :time, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:time, :status])
    |> validate_required([:time, :status])
  end
end
