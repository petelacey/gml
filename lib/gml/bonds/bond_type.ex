defmodule Gml.Bond.BondType do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gml.Bond.BondType


  schema "bond_types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%BondType{} = bond_type, attrs) do
    bond_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
