defmodule Iris.Repo.Migrations.CreateNewsItem do
  use Ecto.Migration

  def change do
    create table(:newsitems) do
      add :title         , :string
      add :provider      , :string
      add :body          , :string
      add :embargo       , :datetime
      add :creation_date , :datetime

      timestamps
    end

  end
end
