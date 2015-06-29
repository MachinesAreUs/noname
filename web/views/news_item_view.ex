defmodule Iris.NewsItemView do
  use Iris.Web, :view

  def render("index.json", %{newsitems: newsitems}) do
    %{data: render_many(newsitems, "news_item.json")}
  end

  def render("show.json", %{news_item: news_item}) do
    %{data: render_one(news_item, "news_item.json")}
  end

  def render("news_item.json", %{news_item: news_item}) do
    %{id: news_item.id}
  end
end
