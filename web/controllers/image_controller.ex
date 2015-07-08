defmodule Iris.ImageController do
  use Iris.Web, :controller

  alias Iris.Image

  plug :scrub_params, "image" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    images = Repo.all(Image)
    render(conn, "index.json", images: images)
  end

  def create(conn, %{"image" => image_params}) do
    changeset = Image.changeset(%Image{}, image_params)

    if changeset.valid? do
      image = Repo.insert(changeset)
      render(conn, "show.json", image: image)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Iris.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    image = Repo.get(Image, id)
    render conn, "show.json", image: image
  end

  def update(conn, %{"id" => id, "image" => image_params}) do
    image = Repo.get(Image, id)
    changeset = Image.changeset(image, image_params)

    if changeset.valid? do
      image = Repo.update(changeset)
      render(conn, "show.json", image: image)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Iris.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    image = Repo.get(Image, id)

    image = Repo.delete(image)
    render(conn, "show.json", image: image)
  end
end
