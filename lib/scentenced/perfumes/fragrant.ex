defmodule Scentenced.Perfumes.Fragrant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fragrants" do
    field :blending_factor, :integer
    field :description, :string
    field :family, :string
    field :name, :string
    field :name_eng, :string
    field :note, :string

    timestamps()
  end

  @doc false
  def changeset(fragrant, attrs) do
    fragrant
    |> cast(attrs, [:name, :name_eng, :description, :blending_factor, :note, :family])
    |> validate_required([:name, :blending_factor, :note, :family])
  end
end
