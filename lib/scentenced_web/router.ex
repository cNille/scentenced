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

  # If users maybe are logged in
  pipeline :auth do
    plug(Scentenced.Auth.AuthAccessPipeline)
  end

  # We use ensure_auth to fail if there is no one logged in
  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end


  scope "/", ScentencedWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create]
  end

  scope "/", ScentencedWeb do
    pipe_through [:browser, :auth]

    resources "/fragrant", FragrantController, only: [:index, :show]
    resources "/sessions", SessionController, only: [:delete]
    resources "/perfume", PerfumeController, only: [:index, :show]
    resources "/users", UserController, only: [:index, :show]
  end

  scope "/", ScentencedWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    resources "/fragrant", FragrantController
    resources "/sessions", SessionController, only: [:delete]
    resources "/perfume", PerfumeController
    resources "/users", UserController, only: [:index, :show]
  end


  # Other scopes may use custom stacks.
  # scope "/api", ScentencedWeb do
  #   pipe_through :api
  # end
end
