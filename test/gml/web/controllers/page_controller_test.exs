defmodule Gml.Web.PageControllerTest do
  use Gml.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Surety Bonds"
  end
end
