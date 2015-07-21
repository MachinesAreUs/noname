defmodule Iris.Node do
  use Ecto.Model
  #import Ecto.Query, only: [from: 2]

  schema "nodes" do
    #field :id    , :integer
    field :name  , :string
    field :script, :string
  end
 
  def get_children(node) do
    from(n in Node,
         join: n2n in NodeToNode, on: n.id == n2n.parent_id,
         inner_join: n1 in Node, on: n1.id == n2n.child_id,
         select: n1,
         where: n.id == ^node.id)
    |> Repo.all
  end
 
  def get_parents(node) do
    from(n in Node,
         join: n2n in NodeToNode, on: n.id == n2n.child_id,
         inner_join: n1 in Node, on: n1.id == n2n.parent_id,
         select: n1,
         where: n.id == ^node.id)
    |> Repo.all
  end
end
