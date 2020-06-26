defmodule AppWeb.Schema.Schema do
  use Absinthe.Schema

  import_types(AppWeb.Schema.Type)

  query do
    @desc "Get a list of events"
    field :investment_plans, list_of(:event) do
      resolve(fn _parent, _args, _resolution ->
        {:ok, App.Plans.InvestmentPlan.list_investment_plans()}
      end)
    end
  end
end
