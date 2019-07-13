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

  pipeline :auth do
    plug(Scentenced.Auth.AuthAccessPipeline)
  end

  scope "/", ScentencedWeb do
    #aoeu
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create]
  end

  scope "/", ScentencedWeb do
    pipe_through [:browser, :auth]

    resources "/users", UserController, only: [:index, :show]
    resources "/fragrant", FragrantController
    resources "/sessions", SessionController, only: [:delete]
    resources "/perfume", PerfumeController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ScentencedWeb do
  #   pipe_through :api
  # end
end
