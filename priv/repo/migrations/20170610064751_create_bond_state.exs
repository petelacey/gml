defmodule Gml.Repo.Migrations.CreateGml.Bond.State do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :code, :string
      add :name, :string

      timestamps()
    end

  end
end
