defmodule AppWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias AppWeb.Schema.InvestmentPlanType
  alias AppWeb.Schema.UserType

  import_types(InvestmentPlanType)
  import_types(UserType)
end
