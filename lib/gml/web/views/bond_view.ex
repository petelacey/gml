defmodule Gml.Web.BondView do
  import Number.Currency
  require Logger

  use Gml.Web, :view

  def fee(amount) do
    Number.Currency.number_to_currency(Decimal.mult(amount, Decimal.new(0.03)))
  end
end
