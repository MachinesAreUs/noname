defmodule Iris.NewsItem do
  use Iris.Web, :model

  schema "newsitems" do
    field :title    , :string
    field :provider , :string
    field :body     , :string
    field :embargo  , Ecto.Date

    timestamps
  end

  @required_fields ~w(title provider body)
  @optional_fields ~w(embargo)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
