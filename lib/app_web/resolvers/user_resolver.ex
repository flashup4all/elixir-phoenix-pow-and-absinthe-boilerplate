defmodule AppWeb.Resolvers.UserResolver do
  def list_users(_, _, _) do
    {:ok, App.Users.list_users()}
  end
end
