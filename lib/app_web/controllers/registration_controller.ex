defmodule AppWeb.RegistrationController do
  use AppWeb, :controller

  alias Ecto.Changeset
  alias Plug.Conn
  alias AppWeb.ErrorHelpers

  @spec create(Conn.t(), map()) :: Conn.t()
  def create(conn, %{"user" => user_params}) do
    conn
    |> Pow.Plug.create_user(user_params)
    |> case do
      {:ok, user, conn} ->
        json(conn, %{
          data: %{
            access_token: conn.private[:api_access_token],
            renewal_token: conn.private[:api_renewal_token],
            user: %{
              email: user.email,
              mobile_no: user.mobile_no,
              name: user.name,
              role: user.role,
              is_admin: user.is_admin
            }
          }
        })

      {:error, changeset, conn} ->
        errors = Changeset.traverse_errors(changeset, &ErrorHelpers.translate_error/1)

        conn
        |> put_status(422)
        |> json(%{error: %{status: 500, message: "Couldn't create user", errors: errors}})
    end
  end
end
