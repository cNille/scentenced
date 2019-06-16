defmodule Scentenced.Repo.Migrations.CreateFragrants do
  use Ecto.Migration

  def change do
    create table(:fragrants) do
      add :name, :string
      add :description, :string
      add :blending_factor, :integer
      add :note, :string
      add :family, :string

      timestamps()
    end

  end
end
