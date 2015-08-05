defmodule Iris.NewsItemView do
  use Iris.Web, :view
  use Timex
  import Iris.Util.Time

  def render("index.json", %{newsitems: newsitems, related_subjects: related_subjects}) do
    %{timestamp:        to_str(Date.now),
      related_subjects: related_subjects,
      news_items:       newsitems |> Enum.map &(without_meta/1)}
  end

  def render("show.json", %{news_item: news_item}) do
    %{news_item: news_item |> without_meta}
  end

  defp without_meta(map) do
    Map.drop map, [:__meta__, :__struct__]
  end
end
