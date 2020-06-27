defmodule AppWeb.Schema.InvestmentPlanType do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  object :investment_plan_type do
    field :id, :id
    field :user_id, :integer
    field :name, :string
    field :description, :string
    field :company_interest, :float
    field :interest, :float
    field :interest_type, :integer
    field :minimum_amount, :decimal
    field :partner_interest, :float
    field :type, :integer
    field :interest_apply_type, :string
    field :status, :integer
    field :is_admin, :boolean
    field :crowdfunding, :boolean
    field :image, :string
    field :duration, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  input_object :investment_plan_input_type do
    field :name, non_null(:string)
    field :description, non_null(:string)
    field :company_interest, non_null(:float)
    field :interest, non_null(:float)
    field :interest_type, non_null(:integer)
    field :minimum_amount, non_null(:decimal)
    field :partner_interest, non_null(:float)
    field :type, non_null(:integer)
    field :interest_apply_type, non_null(:string)
    field :status, non_null(:integer)
    field :is_admin, non_null(:boolean)
    field :crowdfunding, :boolean
    field :image, :string
    field :user_id, non_null(:integer)
    field :duration, non_null(:integer)
  end
end
