defmodule Iris.SubjectCodeController do
  use Iris.Web, :controller

  alias Iris.SubjectCode

  plug :scrub_params, "subject_code" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    subjectcodes = Repo.all(SubjectCode)
    render(conn, "index.json", subjectcodes: subjectcodes)
  end

  def create(conn, %{"subject_code" => subject_code_params}) do
    changeset = SubjectCode.changeset(%SubjectCode{}, subject_code_params)

    if changeset.valid? do
      subject_code = Repo.insert!(changeset)
      render(conn, "show.json", subject_code: subject_code)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Iris.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    subject_code = Repo.get(SubjectCode, id)
    render conn, "show.json", subject_code: subject_code
  end

  def update(conn, %{"id" => id, "subject_code" => subject_code_params}) do
    subject_code = Repo.get(SubjectCode, id)
    changeset = SubjectCode.changeset(subject_code, subject_code_params)

    if changeset.valid? do
      subject_code = Repo.update!(changeset)
      render(conn, "show.json", subject_code: subject_code)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Iris.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    subject_code = Repo.get(SubjectCode, id)

    subject_code = Repo.delete!(subject_code)
    render(conn, "show.json", subject_code: subject_code)
  end
end
