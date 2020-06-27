defmodule AppWeb.Resolvers.InvestmentPlanResolver do
  def investment_plans(_, _, _) do
    {:ok, App.Plans.list_investment_plans()}
  end

  def create(_, %{input: input}, _) do
    App.Plans.create_investment_plan(input)
  end
end
