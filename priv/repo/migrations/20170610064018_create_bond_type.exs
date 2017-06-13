defmodule Gml.Repo.Migrations.CreateGml.Bond.Type do
  use Ecto.Migration

  def change do
    create table(:bond_types) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:bond_types, [:name])
  end
end
