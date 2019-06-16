defmodule ScentencedWeb.FragrantController do
  use ScentencedWeb, :controller

  alias Scentenced.Fragrants
  alias Scentenced.Fragrants.Fragrant

  def index(conn, _params) do
    fragrants = Fragrants.list_fragrants()
    render(conn, "index.html", fragrants: fragrants)
  end

  def new(conn, _params) do
    changeset = Fragrants.change_fragrant(%Fragrant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"fragrant" => fragrant_params}) do
    case Fragrants.create_fragrant(fragrant_params) do
      {:ok, fragrant} ->
        conn
        |> put_flash(:info, "Fragrant created successfully.")
        |> redirect(to: Routes.fragrant_path(conn, :show, fragrant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    fragrant = Fragrants.get_fragrant!(id)
    render(conn, "show.html", fragrant: fragrant)
  end

  def edit(conn, %{"id" => id}) do
    fragrant = Fragrants.get_fragrant!(id)
    changeset = Fragrants.change_fragrant(fragrant)
    render(conn, "edit.html", fragrant: fragrant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "fragrant" => fragrant_params}) do
    fragrant = Fragrants.get_fragrant!(id)

    case Fragrants.update_fragrant(fragrant, fragrant_params) do
      {:ok, fragrant} ->
        conn
        |> put_flash(:info, "Fragrant updated successfully.")
        |> redirect(to: Routes.fragrant_path(conn, :show, fragrant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", fragrant: fragrant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    fragrant = Fragrants.get_fragrant!(id)
    {:ok, _fragrant} = Fragrants.delete_fragrant(fragrant)

    conn
    |> put_flash(:info, "Fragrant deleted successfully.")
    |> redirect(to: Routes.fragrant_path(conn, :index))
  end
end
