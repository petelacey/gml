module BondService
  def self.create_bond(bond_attrs)
    a = permitted_bond_attrs(bond_attrs)
    Bond.create(permitted_bond_attrs(bond_attrs))
  end

  def self.update_bond(id, bond_attrs)
    a = permitted_bond_attrs(bond_attrs)
    bond = Bond.find(id)
    bond.update_attributes(permitted_bond_attrs(bond_attrs))
    bond
  end

  private

  def self.permitted_bond_attrs(attrs)
    a = attrs.permit(:account, :amount, :bond_type_id, :bond_state_id)
  end
end
