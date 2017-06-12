defmodule Gml.Web.BondController do
  use Gml.Web, :controller

  alias Gml.Bonds

  def index(conn, _params) do
    bonds = Bonds.list_bonds()
    render(conn, "index.html", bonds: bonds)
  end

  def new(conn, _params) do
    changeset = Bonds.change_bond(%Gml.Bonds.Bond{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bond" => bond_params}) do
    case Bonds.create_bond(bond_params) do
      {:ok, bond} ->
        conn
        |> put_flash(:info, "Bond created successfully.")
        |> redirect(to: bond_path(conn, :show, bond))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bond = Bonds.get_bond!(id)
    render(conn, "show.html", bond: bond)
  end

  def edit(conn, %{"id" => id}) do
    bond = Bonds.get_bond!(id)
    changeset = Bonds.change_bond(bond)
    render(conn, "edit.html", bond: bond, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bond" => bond_params}) do
    bond = Bonds.get_bond!(id)

    case Bonds.update_bond(bond, bond_params) do
      {:ok, bond} ->
        conn
        |> put_flash(:info, "Bond updated successfully.")
        |> redirect(to: bond_path(conn, :show, bond))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bond: bond, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bond = Bonds.get_bond!(id)
    {:ok, _bond} = Bonds.delete_bond(bond)

    conn
    |> put_flash(:info, "Bond deleted successfully.")
    |> redirect(to: bond_path(conn, :index))
  end
end
