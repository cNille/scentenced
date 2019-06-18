defmodule Scentenced.Perfumes.Perfume do
  use Ecto.Schema
  import Ecto.Changeset

  schema "perfumes" do
    field :name, :string
    field :description, :string
    field :family, :string
    timestamps()
  end

  @doc false
  def changeset(fragrant, attrs) do
    fragrant
    |> cast(attrs, [:name, :description, :family])
    |> validate_required([:name, :description, :family])
  end
end
