defmodule Iris.NewsItemView do
  use Iris.Web, :view

  def render("index.json", %{newsitems: newsitems}) do
    %{news_items: newsitems}
  end

  def render("show.json", %{news_item: news_item}) do
    %{news_item: news_item}
  end

end
