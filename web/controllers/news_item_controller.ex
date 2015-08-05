defmodule Iris.NewsItemController do
  use Iris.Web, :controller

  alias Iris.NewsItem

  plug :scrub_params, "news_item" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    newsitems = Repo.all(NewsItem)
    related_subjects =  [
      %{deportes: 10},
      %{fubol: 3}
    ]
    render conn, "index.json", %{newsitems: newsitems, related_subjects: related_subjects}
  end

  def create(conn, %{"news_item" => news_item_params}) do
    # These 2 lines are because I can't get phoenix to recognize the json in the body.
    # It forcefully expects the parameters to be in the URL.
    # {:ok, body, _conn_details} = Plug.Conn.read_body(conn)
    # news_item = Poison.decode! body

    changeset = NewsItem.changeset(%NewsItem{}, news_item_params)

    if changeset.valid? do
      news_item = Repo.insert!(changeset)
      render(conn, "show.json", news_item: news_item)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Iris.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    news_item = Repo.get(NewsItem, id)
    render conn, "show.json", news_item: news_item
  end

  def update(conn, %{"id" => id, "news_item" => news_item_params}) do
    news_item = Repo.get(NewsItem, id)
    changeset = NewsItem.changeset(news_item, news_item_params)

    if changeset.valid? do
      news_item = Repo.update!(changeset)
      render(conn, "show.json", news_item: news_item)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Iris.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    news_item = Repo.get(NewsItem, id)

    news_item = Repo.delete!(news_item)
    render(conn, "show.json", news_item: news_item)
  end
end
