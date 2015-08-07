defmodule Iris.Repo.Migrations.CreateNewsItem do
  use Ecto.Migration

  def change do
    create table(:newsitems) do
      add :headline      , :string
      add :sub_headline  , :string
      add :body          , :text
      #add :body          , :string, size: 2048
      add :provider      , :string, size: 10
      add :country       , :string, size: 10
      add :language      , :string, size: 2
      add :creation_date , :datetime
      add :embargo       , :datetime

      timestamps
    end

  end
end
