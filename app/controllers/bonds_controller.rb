class BondsController < ApplicationController
  def new
    @bond = Bond.new
    @bond_types = BondType.all
    @bond_states = BondState.all
  end

  def create
    bond_data = params[:bond]
    bond = BondService.create_bond(bond_data)
    p bond.errors.inspect

    flash[:notice] = "Bond #{bond.id} was created."
    redirect_to bond_path(bond)
  end

  def show
	  @bond = Bond.find(params[:id])
  end
end

