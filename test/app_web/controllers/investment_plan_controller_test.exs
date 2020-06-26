defmodule AppWeb.InvestmentPlanControllerTest do
  use AppWeb.ConnCase

  alias App.Plans
  alias App.Plans.InvestmentPlan

  @create_attrs %{
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:investment_plan) do
    {:ok, investment_plan} = Plans.create_investment_plan(@create_attrs)
    investment_plan
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all investment_plans", %{conn: conn} do
      conn = get(conn, Routes.investment_plan_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create investment_plan" do
    test "renders investment_plan when data is valid", %{conn: conn} do
      conn = post(conn, Routes.investment_plan_path(conn, :create), investment_plan: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.investment_plan_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.investment_plan_path(conn, :create), investment_plan: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update investment_plan" do
    setup [:create_investment_plan]

    test "renders investment_plan when data is valid", %{conn: conn, investment_plan: %InvestmentPlan{id: id} = investment_plan} do
      conn = put(conn, Routes.investment_plan_path(conn, :update, investment_plan), investment_plan: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.investment_plan_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, investment_plan: investment_plan} do
      conn = put(conn, Routes.investment_plan_path(conn, :update, investment_plan), investment_plan: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete investment_plan" do
    setup [:create_investment_plan]

    test "deletes chosen investment_plan", %{conn: conn, investment_plan: investment_plan} do
      conn = delete(conn, Routes.investment_plan_path(conn, :delete, investment_plan))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.investment_plan_path(conn, :show, investment_plan))
      end
    end
  end

  defp create_investment_plan(_) do
    investment_plan = fixture(:investment_plan)
    %{investment_plan: investment_plan}
  end
end
