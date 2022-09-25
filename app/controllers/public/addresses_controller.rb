class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to public_addresses_path
    else
      @addresses = Address.where(customer_id: current_customer.id)
      render 'index'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      @addresses = Address.where(customer_id: current_customer.id)
      redirect_to public_addresses_path
    else
      render 'edit'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  private

  def address_params
    params.require(:address).permit(:postal_code,:address,:name,:customer_id)
  end
end
