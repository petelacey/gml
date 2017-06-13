# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Gml.Repo.insert!(%Gml.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Gml.Bond.State
alias Gml.Bond.BondType

Gml.Repo.delete_all(State)

Gml.Repo.insert(%State{
  code: "MA",
  name: "Massachusetts"
})

Gml.Repo.insert(%State{
  code: "NH",
  name: "New Hampshire"
})

Gml.Repo.insert(%State{
  code: "NY",
  name: "New York"
})

Gml.Repo.insert(%State{
  code: "IL",
  name: "Illinois"
})

Gml.Repo.insert(%State{
  code: "TX",
  name: "Texas"
})

Gml.Repo.insert(%State{
  code: "CA",
  name: "California"
})

Gml.Repo.insert(%State{
  code: "OR",
  name: "Oregon"
})

Gml.Repo.delete_all(BondType)

Gml.Repo.insert(%BondType{
  name: "Alcohol Tax Bond"
})

Gml.Repo.insert(%BondType{
  name: "Contractor License Bond"
})

Gml.Repo.insert(%BondType{
  name: "Defective Title Bond"
})

Gml.Repo.insert(%BondType{
  name: "Employee Theft Bond"
})

Gml.Repo.insert(%BondType{
  name: "Finance Lender Bond"
})

Gml.Repo.insert(%BondType{
  name: "Insurance Adjuster Bond"
})

Gml.Repo.insert(%BondType{
  name: "Motor Vehicle Dealer Bond"
})

Gml.Repo.insert(%BondType{
  name: "Notary Public Bond"
})

Gml.Repo.insert(%BondType{
  name: "Tax Preparer Bond"
})

