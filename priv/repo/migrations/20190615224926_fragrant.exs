defmodule Scentenced.Repo.Migrations.Fragrant do
  use Ecto.Migration

  def change do
    alter table("fragrants") do
      add :name_eng, :string
    end

  end
end
