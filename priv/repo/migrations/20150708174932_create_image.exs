defmodule Iris.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :headline       , :string
      add :sub_headline   , :string
      add :country        , :string
      add :provider       , :string
      add :copyright_line , :string
      add :creation_date  , :datetime
      add :embargo        , :datetime

      timestamps
    end

  end
end
