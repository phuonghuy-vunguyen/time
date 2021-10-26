defmodule Xxx.PostsTest do
  use Xxx.DataCase

  alias Xxx.Posts

  describe "users" do
    alias Xxx.Posts.Users

    import Xxx.PostsFixtures

    @invalid_attrs %{email: nil, username: nil}

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Posts.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Posts.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{email: "some email", username: "some username"}

      assert {:ok, %Users{} = users} = Posts.create_users(valid_attrs)
      assert users.email == "some email"
      assert users.username == "some username"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      update_attrs = %{email: "some updated email", username: "some updated username"}

      assert {:ok, %Users{} = users} = Posts.update_users(users, update_attrs)
      assert users.email == "some updated email"
      assert users.username == "some updated username"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_users(users, @invalid_attrs)
      assert users == Posts.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Posts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Posts.change_users(users)
    end
  end
end
