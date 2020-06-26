defmodule App.Repo.Migrations.CreateInvestmentPlans do
  use Ecto.Migration

  def change do
    create table(:investment_plans) do
      add :name, :string
      add :user_id, references(:users), null: false
      add :is_admin, :boolean, default: false, null: true
      add :type, :integer # 1 - investment, 2 - loans, 3-investment returns
      add :interest_type, :integer #1 - flat rate, 2- reducing balance
      add :interest_apply_type, :string #1 - monthly, 2- per-period
      add :description, :string, null: true
      add :minimum_amount, :decimal, default: 0.0
      add :interest, :float
      add :company_interest, :float
      add :partner_interest, :float
      add :duration, :integer, default: 30
      add :crowdfunding, :boolean,  default: false, null: true
      add :status, :integer, default: 0 # 0 - open, 1 - closed
      add :image, :string, null: true

      timestamps()
    end

  end
end
