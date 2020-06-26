defmodule AppWeb.InvestmentPlanController do
  use AppWeb, :controller

  alias App.Plans
  alias App.Plans.InvestmentPlan

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    investment_plans = Plans.list_investment_plans()
    render(conn, "index.json", investment_plans: investment_plans)
  end

  def create(conn, %{"investment_plan" => investment_plan_params}) do
    with {:ok, %InvestmentPlan{} = investment_plan} <- Plans.create_investment_plan(investment_plan_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.investment_plan_path(conn, :show, investment_plan))
      |> render("show.json", investment_plan: investment_plan)
    end
  end

  def show(conn, %{"id" => id}) do
    investment_plan = Plans.get_investment_plan!(id)
    render(conn, "show.json", investment_plan: investment_plan)
  end

  def update(conn, %{"id" => id, "investment_plan" => investment_plan_params}) do
    investment_plan = Plans.get_investment_plan!(id)

    with {:ok, %InvestmentPlan{} = investment_plan} <- Plans.update_investment_plan(investment_plan, investment_plan_params) do
      render(conn, "show.json", investment_plan: investment_plan)
    end
  end

  def delete(conn, %{"id" => id}) do
    investment_plan = Plans.get_investment_plan!(id)

    with {:ok, %InvestmentPlan{}} <- Plans.delete_investment_plan(investment_plan) do
      send_resp(conn, :no_content, "")
    end
  end
end
