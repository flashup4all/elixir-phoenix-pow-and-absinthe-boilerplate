defmodule AppWeb.InvestmentPlanView do
  use AppWeb, :view
  alias AppWeb.InvestmentPlanView

  def render("index.json", %{investment_plans: investment_plans}) do
    %{data: render_many(investment_plans, InvestmentPlanView, "investment_plan.json")}
  end

  def render("show.json", %{investment_plan: investment_plan}) do
    %{data: render_one(investment_plan, InvestmentPlanView, "investment_plan.json")}
  end

  def render("investment_plan.json", %{investment_plan: investment_plan}) do
    %{
      id: investment_plan.id,
      user_id: investment_plan.user_id,
      name: investment_plan.name,
      type: investment_plan.type,
      interest_type: investment_plan.interest_type,
      description: investment_plan.description,
      minimum_amount: investment_plan.minimum_amount,
      interest: investment_plan.interest,
      company_interest: investment_plan.company_interest,
      partner_interest: investment_plan.partner_interest,
      interest_apply_type: investment_plan.interest_apply_type,
      is_admin: investment_plan.is_admin,
      status: investment_plan.status,
      crowdfunding: investment_plan.crowdfunding,
      image: investment_plan.image,
      inserted_at: investment_plan.inserted_at,
      updated_at: investment_plan.updated_at,
      duration: investment_plan.duration
    }
  end
end
