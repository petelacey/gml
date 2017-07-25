defmodule Gml.BondsTest do
  use Gml.DataCase

  alias Gml.Bonds

  describe "bonds" do
    alias Gml.Bonds.Bond
    alias Gml.Bond.State
    alias Gml.Bond.BondType

    @valid_attrs %{account: "some account", amount: "120.5", comments: "some comments"}
    @update_attrs %{account: "some updated account", amount: "456.7", comments: "some updated comments"}
    @invalid_attrs %{account: nil, amount: nil, comments: nil}

    def bond_fixture(attrs \\ %{}) do
      {:ok, state}     = Gml.Repo.insert(%State{ code: "MA", name: "Massachusetts" })
      {:ok, bond_type} = Gml.Repo.insert(%BondType{ name: "Alcohol Tax Bond" })

      {:ok, bond} =
        attrs
        |> Enum.into(%{state_id: state.id, bond_type_id: bond_type.id})
        |> Enum.into(@valid_attrs)
        |> Bonds.create_bond()

      bond
    end

    test "list_bonds/0 returns all bonds" do
      bond = bond_fixture()
      assert Bonds.list_bonds() == [bond]
    end

    test "get_bond!/1 returns the bond with given id" do
      bond = bond_fixture()
      assert Bonds.get_bond!(bond.id).id == bond.id
    end

    test "create_bond/1 with valid data creates a bond" do
      bond = bond_fixture()
      assert bond.account == "some account"
      assert bond.amount == Decimal.new("120.5")
      assert bond.comments == "some comments"
    end

    test "create_bond/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bonds.create_bond(@invalid_attrs)
    end

    test "update_bond/2 with valid data updates the bond" do
      bond = bond_fixture()
      assert {:ok, bond} = Bonds.update_bond(bond, @update_attrs)
      assert %Bond{} = bond
      assert bond.account == "some updated account"
      assert bond.amount == Decimal.new("456.7")
      assert bond.comments == "some updated comments"
    end

    test "update_bond/2 with invalid data returns error changeset" do
      bond = bond_fixture()
      assert {:error, %Ecto.Changeset{}} = Bonds.update_bond(bond, @invalid_attrs)
    end

    test "delete_bond/1 deletes the bond" do
      bond = bond_fixture()
      assert {:ok, %Bond{}} = Bonds.delete_bond(bond)
      assert_raise Ecto.NoResultsError, fn -> Bonds.get_bond!(bond.id) end
    end

    test "change_bond/1 returns a bond changeset" do
      bond = bond_fixture()
      assert %Ecto.Changeset{} = Bonds.change_bond(bond)
    end
  end
end
