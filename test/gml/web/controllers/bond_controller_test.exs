defmodule Gml.Web.BondControllerTest do
  use Gml.Web.ConnCase

  alias Gml.Bonds
  alias Gml.Bond.State
  alias Gml.Bond.BondType

  @create_attrs %{account: "some account", amount: "120.5", comments: "some comments"}
  @update_attrs %{account: "some updated account", amount: "456.7", comments: "some updated comments"}
  @invalid_attrs %{account: nil, amount: nil, comments: nil}

  def fixture(:bond) do
    {:ok, state, bond_type} = assoc_fixtures()

    {:ok, bond} =
      %{state_id: state.id, bond_type_id: bond_type.id}
      |> Enum.into(@create_attrs)
      |> Bonds.create_bond()

    {bond, state, bond_type}
  end

  def assoc_fixtures() do
    {:ok, state}     = Gml.Repo.insert(%State{ code: "MA", name: "Massachusetts" })
    {:ok, bond_type} = Gml.Repo.insert(%BondType{ name: "Alcohol Tax Bond" })
    {:ok, state, bond_type}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, bond_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Bonds"
  end

  test "renders form for new bonds", %{conn: conn} do
    conn = get conn, bond_path(conn, :new)
    assert html_response(conn, 200) =~ "New Bond"
  end

  test "creates bond and redirects to show when data is valid", %{conn: conn} do
    {:ok, state, bond_type} = assoc_fixtures()
    conn = post conn, bond_path(conn, :create), bond: @create_attrs |> Enum.into(%{state_id: state.id, bond_type_id: bond_type.id})

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == bond_path(conn, :show, id)

    conn = get conn, bond_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Your Quote"
  end

  test "does not create bond and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, bond_path(conn, :create), bond: @invalid_attrs
    assert html_response(conn, 200) =~ "New Bond"
  end

  test "renders form for editing chosen bond", %{conn: conn} do
    {bond, _, _} = fixture(:bond)
    conn = get conn, bond_path(conn, :edit, bond)
    assert html_response(conn, 200) =~ "Edit Bond"
  end

  test "updates chosen bond and redirects when data is valid", %{conn: conn} do
    {bond, state, bond_type} = fixture(:bond)
    conn = put conn, bond_path(conn, :update, bond), bond: @update_attrs |> Enum.into(%{state_id: state.id, bond_type_id: bond_type.id})
    assert redirected_to(conn) == bond_path(conn, :show, bond)

    conn = get conn, bond_path(conn, :show, bond)
    assert html_response(conn, 200) =~ "some updated account"
  end

  test "does not update chosen bond and renders errors when data is invalid", %{conn: conn} do
    {bond, _, _} = fixture(:bond)
    conn = put conn, bond_path(conn, :update, bond), bond: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Bond"
  end

  test "deletes chosen bond", %{conn: conn} do
    {bond, _, _} = fixture(:bond)
    conn = delete conn, bond_path(conn, :delete, bond)
    assert redirected_to(conn) == bond_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, bond_path(conn, :show, bond)
    end
  end
end
