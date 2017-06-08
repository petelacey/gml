defmodule Gml.Web.PageController do
  use Gml.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
