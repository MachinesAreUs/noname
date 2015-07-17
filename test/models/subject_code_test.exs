defmodule Iris.SubjectCodeTest do
  use Iris.ModelCase

  alias Iris.SubjectCode

  @valid_attrs %{name: "some content", short_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SubjectCode.changeset(%SubjectCode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SubjectCode.changeset(%SubjectCode{}, @invalid_attrs)
    refute changeset.valid?
  end
end
