defmodule App.Plans do
  @moduledoc """
  The Plans context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Plans.InvestmentPlan

  @doc """
  Returns the list of investment_plans.

  ## Examples

      iex> list_investment_plans()
      [%InvestmentPlan{}, ...]

  """
  def list_investment_plans do
    Repo.all(InvestmentPlan)
  end

  @doc """
  Gets a single investment_plan.

  Raises `Ecto.NoResultsError` if the Investment plan does not exist.

  ## Examples

      iex> get_investment_plan!(123)
      %InvestmentPlan{}

      iex> get_investment_plan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_investment_plan!(id), do: Repo.get!(InvestmentPlan, id)

  @doc """
  Creates a investment_plan.

  ## Examples

      iex> create_investment_plan(%{field: value})
      {:ok, %InvestmentPlan{}}

      iex> create_investment_plan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_investment_plan(attrs \\ %{}) do
    %InvestmentPlan{}
    |> InvestmentPlan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a investment_plan.

  ## Examples

      iex> update_investment_plan(investment_plan, %{field: new_value})
      {:ok, %InvestmentPlan{}}

      iex> update_investment_plan(investment_plan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_investment_plan(%InvestmentPlan{} = investment_plan, attrs) do
    investment_plan
    |> InvestmentPlan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a investment_plan.

  ## Examples

      iex> delete_investment_plan(investment_plan)
      {:ok, %InvestmentPlan{}}

      iex> delete_investment_plan(investment_plan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_investment_plan(%InvestmentPlan{} = investment_plan) do
    Repo.delete(investment_plan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking investment_plan changes.

  ## Examples

      iex> change_investment_plan(investment_plan)
      %Ecto.Changeset{data: %InvestmentPlan{}}

  """
  def change_investment_plan(%InvestmentPlan{} = investment_plan, attrs \\ %{}) do
    InvestmentPlan.changeset(investment_plan, attrs)
  end
end
