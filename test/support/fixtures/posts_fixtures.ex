defmodule Xxx.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Xxx.Posts` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Xxx.Posts.create_users()

    users
  end
end
