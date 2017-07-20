defmodule Gml.Repo.Migrations.CreateGml.Bonds.Bond do
  use Ecto.Migration

  def change do
    create table(:bonds) do
      add :amount, :decimal, null: false
      add :comments, :text
      add :account, :string, null: false
      add :state_id, references(:states, on_delete: :nothing), null: false
      add :bond_type_id, references(:bond_types, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:bonds, [:state_id])
    create index(:bonds, [:bond_type_id])
  end
end