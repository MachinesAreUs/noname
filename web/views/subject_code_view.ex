defmodule Iris.SubjectCodeView do
  use Iris.Web, :view

  def render("index.json", %{subjectcodes: subjectcodes}) do
    %{data: render_many(subjectcodes, "subject_code.json")}
  end

  def render("show.json", %{subject_code: subject_code}) do
    %{data: render_one(subject_code, "subject_code.json")}
  end

  def render("subject_code.json", %{subject_code: subject_code}) do
    %{id: subject_code.id}
  end
end
