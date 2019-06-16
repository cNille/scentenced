defmodule ScentencedWeb.Router do
  use ScentencedWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ScentencedWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/fragrant", FragrantController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ScentencedWeb do
  #   pipe_through :api
  # end
end
