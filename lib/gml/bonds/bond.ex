defmodule Gml.Bonds.Bond do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gml.Bonds.Bond

  schema "bonds" do
    field :account, :string
    field :amount, :decimal
    field :comments, :string
    belongs_to :state, Gml.Bond.State
    belongs_to :bond_type, Gml.Bond.BondType

    timestamps()
  end

  @doc false
  def changeset(%Bond{} = bond, attrs) do
    bond
    |> cast(attrs, [:amount, :comments, :account, :state_id, :bond_type_id])
    |> validate_required([:amount, :comments, :account, :state_id, :bond_type_id])
  end
end
