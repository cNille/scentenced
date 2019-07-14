defmodule Scentenced.Auth.AuthAccessPipeline do
  @moduledoc false

  use Guardian.Plug.Pipeline,
    otp_app: :scentenced,
    error_handler: Scentenced.Auth.AuthErrorHandler,
    module: Scentenced.Auth.Guardian

  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
end
