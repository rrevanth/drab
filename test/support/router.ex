defmodule DrabTestApp.Router do
  use DrabTestApp.Web, :router

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

  scope "/", DrabTestApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index, as: :index
    get "/tests/core", PageController, :core, as: :core
    get "/tests/query", PageController, :query, as: :query
    get "/tests/modal", PageController, :modal, as: :modal
    get "/tests/waiter", PageController, :waiter, as: :waiter
  end

  # Other scopes may use custom stacks.
  # scope "/api", DrabTestApp do
  #   pipe_through :api
  # end
end
