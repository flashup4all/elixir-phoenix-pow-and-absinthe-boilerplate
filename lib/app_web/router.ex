defmodule AppWeb.Router do
  use AppWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowEmailConfirmation]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug AppWeb.APIAuthPlug, otp_app: :app
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: AppWeb.APIAuthErrorHandler
  end

  scope "/", AppWeb do
    pipe_through :browser

    get "/", PageController, :index
    
    # pow_routes()
    # pow_extension_routes()
    
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: AppWeb.Schema.Schema
  end

  #non auth routes
  scope "/api/v1", AppWeb, as: :api_v1 do
    pipe_through :api

    resources "/registration", RegistrationController, singleton: true, only: [:create]
    resources "/session", SessionController, singleton: true, only: [:create, :delete]
    post "/session/renew", SessionController, :renew
  end

  #auth routes
  scope "/api/v1", AppWeb do
    pipe_through [:api, :api_protected]

    # Your protected API endpoints here
    resources "/investment-plan", InvestmentPlanController
  end


  # Other scopes may use custom stacks.
  # scope "/api", AppWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: AppWeb.Telemetry
    end
  end
end
