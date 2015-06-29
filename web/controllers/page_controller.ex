defmodule Iris.PageController do
  use Iris.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
