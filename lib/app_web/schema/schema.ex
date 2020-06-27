defmodule AppWeb.Schema.Schema do
  use Absinthe.Schema
  alias AppWeb.Resolvers
  import_types(AppWeb.Schema.Types)

  query do
    @desc "Get a list of investment plans"
    field :investment_plans, list_of(:investment_plan_type) do
      resolve(&Resolvers.InvestmentPlanResolver.investment_plans/3)
      #   resolve(fn _parent, _args, _resolution ->
      #     {:ok, App.Plans.InvestmentPlan.list_investment_plans()}
      #   end)
    end

    @desc "Get list of users"
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.list_users/3)
    end
  end

  mutation do
    @desc "create a new investment plan"
    field :create_investment_plan, type: :investment_plan_type do
      arg(:input, non_null(:investment_plan_input_type))

      resolve(&Resolvers.InvestmentPlanResolver.create/3)
    end
  end
end
