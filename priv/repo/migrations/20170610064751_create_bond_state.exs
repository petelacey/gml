defmodule Gml.Repo.Migrations.CreateGml.Bond.State do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :code, :string, null: false
      add :name, :string, null: false

      timestamps()
    end
  
    create unique_index(:states, [:code])
    create unique_index(:states, [:name])
  end
end
