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
    conn = Guardian.Plug.sign_in(conn, user)
    conn = assign(conn, :current_user, user)
    put_user_token(conn, user)
  end

  def logout(conn) do
    conn
    |> Guardian.Plug.sign_out()
  end

  def load_current_user(conn, _) do
    user = Guardian.Plug.current_resource(conn)

    IO.puts "HEJHEJH"
    user |> inspect() |> Logger.debug
    IO.puts "HEJHEJH"

    conn
    |> assign(:current_user, user)
    |> put_user_token(user)
  end

  defp put_user_token(conn, user) do
    IO.puts "WHAAT"
    user |> inspect() |> Logger.debug
    token = Phoenix.Token.sign(conn, "user socket", user.id)

    conn
    |> assign(:user_token, token)
  end
end
