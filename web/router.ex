defmodule Iris.Router do
  use Iris.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Iris do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/newsitems", NewsItemController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Iris do
  #   pipe_through :api
  # end
end
