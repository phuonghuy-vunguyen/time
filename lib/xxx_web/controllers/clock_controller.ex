defmodule XxxWeb.ClockController do
  use XxxWeb, :controller

  alias Xxx.Posts1
  alias Xxx.Posts1.Clock

  def index(conn, _params) do
    clock = Posts1.list_clock()
    render(conn, "index.html", clock: clock)
  end

  def new(conn, _params) do
    changeset = Posts1.change_clock(%Clock{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"clock" => clock_params}) do
    case Posts1.create_clock(clock_params) do
      {:ok, clock} ->
        conn
        |> put_flash(:info, "Clock created successfully.")
        |> redirect(to: Routes.clock_path(conn, :show, clock))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clock = Posts1.get_clock!(id)
    render(conn, "show.html", clock: clock)
  end

  def edit(conn, %{"id" => id}) do
    clock = Posts1.get_clock!(id)
    changeset = Posts1.change_clock(clock)
    render(conn, "edit.html", clock: clock, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Posts1.get_clock!(id)

    case Posts1.update_clock(clock, clock_params) do
      {:ok, clock} ->
        conn
        |> put_flash(:info, "Clock updated successfully.")
        |> redirect(to: Routes.clock_path(conn, :show, clock))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", clock: clock, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Posts1.get_clock!(id)
    {:ok, _clock} = Posts1.delete_clock(clock)

    conn
    |> put_flash(:info, "Clock deleted successfully.")
    |> redirect(to: Routes.clock_path(conn, :index))
  end
end
