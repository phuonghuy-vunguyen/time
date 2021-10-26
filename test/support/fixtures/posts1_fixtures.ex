defmodule Xxx.Posts1Fixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Xxx.Posts1` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2021-10-25 14:43:00]
      })
      |> Xxx.Posts1.create_clock()

    clock
  end
end
