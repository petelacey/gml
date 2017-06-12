defmodule Gml.Bond.State do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gml.Bond.State


  schema "states" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%State{} = state, attrs) do
    state
    |> cast(attrs, [:code, :name])
    |> validate_required([:code, :name])
  end
end
