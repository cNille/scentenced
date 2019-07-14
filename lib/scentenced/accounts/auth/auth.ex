defmodule Scentenced.Auth do
  @moduledoc false

  require Ecto.Query
  require Logger

  import Plug.Conn

  alias Scentenced.Auth.Guardian
  alias Scentenced.Accounts.User
  alias Scentenced.Repo

  def authenticate_user(email, given_password) do
    query = Ecto.Query.from(u in User, where: u.email == ^email)

    Repo.one(query)
    |> Bcrypt.check_pass(given_password)
  end

  def login(conn, user) do
    conn
    |> Guardian.Plug.sign_in(user)
    |> put_user_token(user)
  end

  def logout(conn) do
    conn
    |> Guardian.Plug.sign_out()
  end

  def load_current_user(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    conn
    |> assign(:current_user, user)
    |> put_user_token(user)
  end

  defp put_user_token(conn, user) do
    token = Phoenix.Token.sign(conn, "user socket", user.id)
    conn
    |> put_session(:user_token, token)
  end
end
