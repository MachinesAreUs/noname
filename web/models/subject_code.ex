defmodule Iris.SubjectCode do
  use Iris.Web, :model

  schema "subjectcodes" do
    field :name, :string
    field :short_name, :string

    timestamps
  end

  @required_fields ~w(name short_name)
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
