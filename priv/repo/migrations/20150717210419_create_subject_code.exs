defmodule Iris.Repo.Migrations.CreateSubjectCode do
  use Ecto.Migration

  def change do
    create table(:subjectcodes) do
      add :name, :string
      add :short_name, :string

      timestamps
    end

  end
end
