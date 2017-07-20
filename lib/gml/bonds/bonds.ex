defmodule Gml.Bonds do
  @moduledoc """
  The boundary for the Bonds system.
  """

  import Ecto.Query, warn: false
  alias Gml.Repo

  alias Gml.Bonds.Bond

  @doc """
  Returns the list of bonds.

  ## Examples

      iex> list_bonds()
      [%Bond{}, ...]

  """
  def list_bonds do
    Repo.all(Bond)
  end

  @doc """
  Gets a single bond.

  Raises `Ecto.NoResultsError` if the Bond does not exist.

  ## Examples

      iex> get_bond!(123)
      %Bond{}

      iex> get_bond!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bond!(id) do
    Repo.get!(Bond, id) |> Repo.preload([:state, :bond_type])
  end

  @doc """
  Creates a bond.

  ## Examples

      iex> create_bond(%{field: value})
      {:ok, %Bond{}}

      iex> create_bond(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bond(attrs \\ %{}) do
    %Bond{}
    |> Bond.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bond.

  ## Examples

      iex> update_bond(bond, %{field: new_value})
      {:ok, %Bond{}}

      iex> update_bond(bond, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bond(%Bond{} = bond, attrs) do
    bond
    |> Bond.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bond.

  ## Examples

      iex> delete_bond(bond)
      {:ok, %Bond{}}

      iex> delete_bond(bond)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bond(%Bond{} = bond) do
    Repo.delete(bond)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bond changes.

  ## Examples

      iex> change_bond(bond)
      %Ecto.Changeset{source: %Bond{}}

  """
  def change_bond(%Bond{} = bond) do
    Bond.changeset(bond, %{})
  end

  @doc """
  Returns a struct containing all data that can be associated with a bond.
  That is, a list of states and bond types

  """

  def get_associated_data() do
    %{
      states: Repo.all(Gml.Bond.State),
      types:  Repo.all(Gml.Bond.BondType)
    }
  end
end
