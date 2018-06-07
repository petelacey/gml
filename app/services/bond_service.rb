module BondService
  def self.create_bond(bond_attrs)
    a = permitted_bond_attrs(bond_attrs)
    puts a.inspect
    Bond.create(permitted_bond_attrs(bond_attrs))
  end

  private

  def self.permitted_bond_attrs(attrs)
    a = attrs.permit(:account, :amount, :bond_type_id, :bond_state_id)
  end
end
