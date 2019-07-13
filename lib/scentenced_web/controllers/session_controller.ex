defmodule ScentencedWeb.SessionController do
  use ScentencedWeb, :controller

  def new(conn, _params) do
    render(conn, "login.html")
  end

  def create(conn, %{"email" => email, "password" => password}) do
    case Scentenced.Auth.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> Scentenced.Auth.login(user)
        |> put_flash(:info, "Welcome user!")
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Wrong credentials...")
        |> render("login.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Scentenced.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
