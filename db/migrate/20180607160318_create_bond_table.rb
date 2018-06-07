class CreateBondTable < ActiveRecord::Migration[5.2]
  def change
    create_table :bond_states do |t|
      t.string :code, null: false, index: true
      t.string :name, null: false

      t.timestamps
    end

    create_table :bond_types do |t|
      t.string :name, null: false, index: true

      t.timestamps
    end

    create_table :bonds do |t|
      t.string  :account, null: false
      t.decimal :amount,  null: false
      t.text    :comments

      t.references :bond_state, index: true, foreign_key: true
      t.references :bond_type,  index: true
      t.timestamps
    end
  end
end
