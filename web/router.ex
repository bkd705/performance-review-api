defmodule Reviewster.Router do
  use Reviewster.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Reviewster do
    pipe_through :api

    resources "/employee", EmployeeController, except: [:new, :edit]
  end
end
