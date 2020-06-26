defmodule AppWeb.Schema.Type do
    use Absinthe.Schema.Notation

    object :investment_plans do
      field :id, :id
      field :name, :string
      field :description, :string
    end
end