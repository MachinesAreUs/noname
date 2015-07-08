defmodule Iris.ImageView do
  use Iris.Web, :view

  def render("index.json", %{images: images}) do
    %{data: render_many(images, "image.json")}
  end

  def render("show.json", %{image: image}) do
    %{data: render_one(image, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{id: image.id}
  end
end
