defmodule Scentenced.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Scentenced.Accounts.User

  @moduledoc false

  schema "users" do
    field(:name, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    field(:email, :string)

    timestamps()
  end

  @doc false
  def registration_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:email, :password])
    |> validate_length(:email, min: 5, max: 50)
    |> validate_length(:password, min: 5, max: 100)
    |> unique_constraint(:username)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: truel, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(pass))

    _ ->
      changeset
    end
  end
end
