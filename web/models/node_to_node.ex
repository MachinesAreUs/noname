defmodule Iris.NodeToNode do
  use Ecto.Model

  schema "node_to_node" do
    belongs_to :parent_id, Node
    belongs_to :child_id, Node
  end

end
