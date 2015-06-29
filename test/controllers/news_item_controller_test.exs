defmodule Iris.NewsItemControllerTest do
  use Iris.ConnCase

  alias Iris.NewsItem
  @valid_attrs %{body: "some content", embargo: %{day: 17, month: 4, year: 2010}, provider: "some content", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, news_item_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    news_item = Repo.insert %NewsItem{}
    conn = get conn, news_item_path(conn, :show, news_item)
    assert json_response(conn, 200)["data"] == %{
      "id" => news_item.id
    }
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, news_item_path(conn, :create), news_item: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(NewsItem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, news_item_path(conn, :create), news_item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    news_item = Repo.insert %NewsItem{}
    conn = put conn, news_item_path(conn, :update, news_item), news_item: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(NewsItem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    news_item = Repo.insert %NewsItem{}
    conn = put conn, news_item_path(conn, :update, news_item), news_item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    news_item = Repo.insert %NewsItem{}
    conn = delete conn, news_item_path(conn, :delete, news_item)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(NewsItem, news_item.id)
  end
end
