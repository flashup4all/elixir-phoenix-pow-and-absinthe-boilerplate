defmodule AppWeb.Schema.UserType do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  object :user_type do
    field :id, :id
    field :name, :string
    field :email, :string
    field :is_admin, :boolean
    field :provider, :string
    field :mobile_no, :string
    field :role, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  input_object :user_input_type do
    field :name, non_null(:string)
  end
end
