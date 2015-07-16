defmodule Iris.NewsItemTest do
  use Iris.ModelCase

  alias Iris.NewsItem

  @valid_attrs %{
    body:          "some content",
    embargo:       %{day: 17, month: 4, year: 2015, hour: 0, min: 0, sec: 0},
    creation_date: %{day: 17, month: 4, year: 2015, hour: 0, min: 0, sec: 0},
    provider:      "some content",
    title:         "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = NewsItem.changeset(%NewsItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = NewsItem.changeset(%NewsItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
