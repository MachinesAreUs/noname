defmodule Iris.Image do
  use Iris.Web, :model

  schema "images" do
    field :headline, :string
    field :sub_headline, :string
    field :country, :string
    field :provider, :string
    field :copyright_line, :string
    field :creation_date, Ecto.Date
    field :embargo, Ecto.Date

    timestamps
  end

  @required_fields ~w(headline sub_headline country provider copyright_line creation_date embargo)
  @optional_fields ~w()

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