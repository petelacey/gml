class Bond < ApplicationRecord
  belongs_to :bond_state, optional: true
  belongs_to :bond_type, optional: true
end
