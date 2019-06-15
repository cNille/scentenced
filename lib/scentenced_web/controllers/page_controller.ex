defmodule ScentencedWeb.PageController do
  use ScentencedWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
