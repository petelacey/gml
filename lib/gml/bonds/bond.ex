defmodule Gml.Bonds.Bond do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gml.Bonds.Bond

  schema "bonds" do
    field :account, :string
    field :amount, :decimal
    field :comments, :string
    field :state_id, :id
    field :bond_type_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Bond{} = bond, attrs) do
    bond
    |> cast(attrs, [:amount, :comments, :account])
    |> validate_required([:amount, :comments, :account])
  end
end
