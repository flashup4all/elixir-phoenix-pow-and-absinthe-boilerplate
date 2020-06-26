defmodule App.PlansTest do
  use App.DataCase

  alias App.Plans

  describe "investment_plans" do
    alias App.Plans.InvestmentPlan

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def investment_plan_fixture(attrs \\ %{}) do
      {:ok, investment_plan} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Plans.create_investment_plan()

      investment_plan
    end

    test "list_investment_plans/0 returns all investment_plans" do
      investment_plan = investment_plan_fixture()
      assert Plans.list_investment_plans() == [investment_plan]
    end

    test "get_investment_plan!/1 returns the investment_plan with given id" do
      investment_plan = investment_plan_fixture()
      assert Plans.get_investment_plan!(investment_plan.id) == investment_plan
    end

    test "create_investment_plan/1 with valid data creates a investment_plan" do
      assert {:ok, %InvestmentPlan{} = investment_plan} = Plans.create_investment_plan(@valid_attrs)
      assert investment_plan.description == "some description"
      assert investment_plan.name == "some name"
    end

    test "create_investment_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plans.create_investment_plan(@invalid_attrs)
    end

    test "update_investment_plan/2 with valid data updates the investment_plan" do
      investment_plan = investment_plan_fixture()
      assert {:ok, %InvestmentPlan{} = investment_plan} = Plans.update_investment_plan(investment_plan, @update_attrs)
      assert investment_plan.description == "some updated description"
      assert investment_plan.name == "some updated name"
    end

    test "update_investment_plan/2 with invalid data returns error changeset" do
      investment_plan = investment_plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Plans.update_investment_plan(investment_plan, @invalid_attrs)
      assert investment_plan == Plans.get_investment_plan!(investment_plan.id)
    end

    test "delete_investment_plan/1 deletes the investment_plan" do
      investment_plan = investment_plan_fixture()
      assert {:ok, %InvestmentPlan{}} = Plans.delete_investment_plan(investment_plan)
      assert_raise Ecto.NoResultsError, fn -> Plans.get_investment_plan!(investment_plan.id) end
    end

    test "change_investment_plan/1 returns a investment_plan changeset" do
      investment_plan = investment_plan_fixture()
      assert %Ecto.Changeset{} = Plans.change_investment_plan(investment_plan)
    end
  end
end
