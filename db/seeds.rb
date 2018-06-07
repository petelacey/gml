# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BondState.delete_all

BondState.create(
  code: "MA",
  name: "Massachusetts"
)

BondState.create(
  code: "NH",
  name: "New Hampshire"
)

BondState.create(
  code: "NY",
  name: "New York"
)

BondState.create(
  code: "IL",
  name: "Illinois"
)

BondState.create(
  code: "TX",
  name: "Texas"
)

BondState.create(
  code: "CA",
  name: "California"
)

BondState.create(
  code: "OR",
  name: "Oregon"
)

BondType.delete_all

BondType.create(
  name: "Alcohol Tax Bond"
)

BondType.create(
  name: "Contractor License Bond"
)

BondType.create(
  name: "Defective Title Bond"
)

BondType.create(
  name: "Employee Theft Bond"
)

BondType.create(
  name: "Finance Lender Bond"
)

BondType.create(
  name: "Insurance Adjuster Bond"
)

BondType.create(
  name: "Motor Vehicle Dealer Bond"
)

BondType.create(
  name: "Notary Public Bond"
)

BondType.create(
  name: "Tax Preparer Bond"
)

