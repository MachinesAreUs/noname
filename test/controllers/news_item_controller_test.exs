defmodule Iris.NewsItemControllerTest do
  use Iris.ConnCase

  alias Iris.NewsItem
  @valid_attrs %{
    body:          "some content",
    creation_date: %Ecto.DateTime{day: 17, month: 4, year: 2015, hour: 0, min: 0, sec: 0},
    embargo:       %Ecto.DateTime{day: 17, month: 4, year: 2015, hour: 0, min: 0, sec: 0},
    provider:      "some content",
    title:         "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, news_item_path(conn, :index)
    assert json_response(conn, 200)["news_items"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    import Iris.Time

    news_item = Repo.insert!(Map.merge(%NewsItem{}, @valid_attrs))
    conn = get conn, news_item_path(conn, :show, news_item)
    assert json_response(conn, 200)["news_item"] == %{
      "id"            => news_item.id,
      "title"         => news_item.title,
      "body"          => news_item.body,
      "provider"      => news_item.provider,
      "creation_date" => to_timestamp_str(news_item.creation_date),
      "embargo"       => to_timestamp_str(news_item.embargo),
      "inserted_at"   => to_timestamp_str(news_item.inserted_at),
      "updated_at"    => to_timestamp_str(news_item.updated_at)
    }
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, news_item_path(conn, :create), news_item: @valid_attrs
    assert json_response(conn, 200)["news_item"]["id"]
    assert Repo.get_by(NewsItem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, news_item_path(conn, :create), news_item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    news_item = Repo.insert! %NewsItem{}
    conn = put conn, news_item_path(conn, :update, news_item), news_item: @valid_attrs
    assert json_response(conn, 200)["news_item"]["id"]
    assert Repo.get_by(NewsItem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    news_item = Repo.insert! %NewsItem{}
    conn = put conn, news_item_path(conn, :update, news_item), news_item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    news_item = Repo.insert! %NewsItem{}
    conn = delete conn, news_item_path(conn, :delete, news_item)
    assert json_response(conn, 200)["news_item"]["id"]
    refute Repo.get(NewsItem, news_item.id)
  end
end
