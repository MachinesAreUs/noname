defmodule Iris.SubjectCodeControllerTest do
  use Iris.ConnCase

  alias Iris.SubjectCode
  @valid_attrs %{name: "some content", short_name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, subject_code_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    subject_code = Repo.insert %SubjectCode{}
    conn = get conn, subject_code_path(conn, :show, subject_code)
    assert json_response(conn, 200)["data"] == %{
      "id" => subject_code.id
    }
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, subject_code_path(conn, :create), subject_code: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(SubjectCode, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, subject_code_path(conn, :create), subject_code: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    subject_code = Repo.insert %SubjectCode{}
    conn = put conn, subject_code_path(conn, :update, subject_code), subject_code: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(SubjectCode, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    subject_code = Repo.insert %SubjectCode{}
    conn = put conn, subject_code_path(conn, :update, subject_code), subject_code: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    subject_code = Repo.insert %SubjectCode{}
    conn = delete conn, subject_code_path(conn, :delete, subject_code)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(SubjectCode, subject_code.id)
  end
end
