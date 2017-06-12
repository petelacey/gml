defmodule Gml.Repo.Migrations.CreateGml.Bonds.Bond do
  use Ecto.Migration

  def change do
    create table(:bonds) do
      add :amount, :decimal
      add :comments, :text
      add :account, :string
      add :state_id, references(:states, on_delete: :nothing)
      add :bond_type_id, references(:bond_types, on_delete: :nothing)

      timestamps()
    end

    create index(:bonds, [:state_id])
    create index(:bonds, [:bond_type_id])
  end
end
