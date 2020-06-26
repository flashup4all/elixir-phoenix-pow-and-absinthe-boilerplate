defmodule App.Plans.InvestmentPlan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "investment_plans" do
    field :company_interest, :float
    field :description, :string
    field :interest, :float
    field :interest_type, :integer
    field :minimum_amount, :decimal
    field :name, :string
    field :partner_interest, :float
    field :type, :integer
    field :interest_apply_type, :string
    field :status, :integer, default: 0
    field :is_admin, :boolean, default: false
    field :crowdfunding, :boolean, default: false
    field :image, :string, null: true
    field :duration, :integer

    belongs_to :user, App.Users.User

    timestamps()
  end

  @doc false
  def changeset(investment_plan, attrs) do
    investment_plan
    |> cast(attrs, [:name, :type, :interest_type, :description, :minimum_amount, :interest, :company_interest, :partner_interest, :user_id, :interest_apply_type, :status, :is_admin, :duration])
    |> validate_required([:name, :type, :interest_type, :description, :minimum_amount, :interest, :company_interest, :partner_interest, :user_id, :interest_apply_type, :duration])
  end
end
