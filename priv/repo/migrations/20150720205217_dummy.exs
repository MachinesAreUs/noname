defmodule Iris.Repo.Migrations.Dummy do
  use Ecto.Migration

  #  def change do
  #  end

  def change do

    create table(:nodes, primary_key: false) do
      add :id     , :integer , primary_key: true , null: false
      add :name   , :string  , null: false
      add :script , :string
    end

    create table(:node_to_node) do
      add :parent_id , references(:nodes) , null: false
      add :child_id  , references(:nodes) , null: false
    end
  end

end
