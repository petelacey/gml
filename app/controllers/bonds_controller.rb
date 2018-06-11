class BondsController < ApplicationController
  def new
    @bond = Bond.new
    @bond_types = BondType.all
    @bond_states = BondState.all
  end

  def create
    bond_data = params[:bond]
    bond = BondService.create_bond(bond_data)

    flash[:notice] = "Bond #{bond.id} was created."
    redirect_to bond_path(bond)
  end

  def show
    @bond = Bond.find(params[:id])
  end

  def index
   @bonds = Bond.all
  end

  def edit
    @bond = Bond.find(params[:id])
    @bond_types = BondType.all
    @bond_states = BondState.all
  end

  def update
    bond_data = params[:bond]
    bond = BondService.update_bond(params[:id], bond_data)

    flash[:notice] = "Bond #{bond.id} was created."
    redirect_to bond_path(bond)
  end
end

