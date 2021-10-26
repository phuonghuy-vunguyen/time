defmodule XxxWeb.ClockControllerTest do
  use XxxWeb.ConnCase

  import Xxx.Posts1Fixtures

  @create_attrs %{status: true, time: ~N[2021-10-25 14:43:00]}
  @update_attrs %{status: false, time: ~N[2021-10-26 14:43:00]}
  @invalid_attrs %{status: nil, time: nil}

  describe "index" do
    test "lists all clock", %{conn: conn} do
      conn = get(conn, Routes.clock_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clock"
    end
  end

  describe "new clock" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.clock_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clock"
    end
  end

  describe "create clock" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.clock_path(conn, :create), clock: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.clock_path(conn, :show, id)

      conn = get(conn, Routes.clock_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clock"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.clock_path(conn, :create), clock: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clock"
    end
  end

  describe "edit clock" do
    setup [:create_clock]

    test "renders form for editing chosen clock", %{conn: conn, clock: clock} do
      conn = get(conn, Routes.clock_path(conn, :edit, clock))
      assert html_response(conn, 200) =~ "Edit Clock"
    end
  end

  describe "update clock" do
    setup [:create_clock]

    test "redirects when data is valid", %{conn: conn, clock: clock} do
      conn = put(conn, Routes.clock_path(conn, :update, clock), clock: @update_attrs)
      assert redirected_to(conn) == Routes.clock_path(conn, :show, clock)

      conn = get(conn, Routes.clock_path(conn, :show, clock))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, clock: clock} do
      conn = put(conn, Routes.clock_path(conn, :update, clock), clock: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clock"
    end
  end

  describe "delete clock" do
    setup [:create_clock]

    test "deletes chosen clock", %{conn: conn, clock: clock} do
      conn = delete(conn, Routes.clock_path(conn, :delete, clock))
      assert redirected_to(conn) == Routes.clock_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.clock_path(conn, :show, clock))
      end
    end
  end

  defp create_clock(_) do
    clock = clock_fixture()
    %{clock: clock}
  end
end
