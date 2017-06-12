defmodule Gml.Repo.Migrations.CreateGml.Bond.Type do
  use Ecto.Migration

  def change do
    create table(:bond_types) do
      add :name, :string

      timestamps()
    end

  end
end
