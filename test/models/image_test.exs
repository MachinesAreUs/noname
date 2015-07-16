defmodule Iris.ImageTest do
  use Iris.ModelCase

  alias Iris.Image

  @valid_attrs %{
    copyright_line: "some content",
    country:        "some content",
    creation_date:  %{day: 17, month: 4, year: 2010, hour: 0, min: 0, sec: 0},
    embargo:        %{day: 17, month: 4, year: 2010, hour: 0, min: 0, sec: 0},
    headline:       "some content",
    provider:       "some content",
    sub_headline:   "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Image.changeset(%Image{}, @invalid_attrs)
    refute changeset.valid?
  end
end
