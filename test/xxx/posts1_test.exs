defmodule Xxx.Posts1Test do
  use Xxx.DataCase

  alias Xxx.Posts1

  describe "clock" do
    alias Xxx.Posts1.Clock

    import Xxx.Posts1Fixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clock/0 returns all clock" do
      clock = clock_fixture()
      assert Posts1.list_clock() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Posts1.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: true, time: ~N[2021-10-25 14:43:00]}

      assert {:ok, %Clock{} = clock} = Posts1.create_clock(valid_attrs)
      assert clock.status == true
      assert clock.time == ~N[2021-10-25 14:43:00]
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts1.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: false, time: ~N[2021-10-26 14:43:00]}

      assert {:ok, %Clock{} = clock} = Posts1.update_clock(clock, update_attrs)
      assert clock.status == false
      assert clock.time == ~N[2021-10-26 14:43:00]
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts1.update_clock(clock, @invalid_attrs)
      assert clock == Posts1.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Posts1.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Posts1.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Posts1.change_clock(clock)
    end
  end
end
