defmodule Scentenced.Repo.Migrations.AddPerfumesTable do
  use Ecto.Migration

  def change do
    create table(:perfumes) do
      add :name, :string
      add :description, :string
      add :family, :string

      timestamps()
    end


  end
end
