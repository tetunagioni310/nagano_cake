class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def edit
    @customer = current_customer
  end

  def show
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
     redirect_to public_customer_path(@customer.id)
    else
     render 'edit'
    end
  end
  
  def quit
  end
  
  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.is_deleted = "true"
    @customer.save
    reset_session
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:password,:postal_code,:address,:telephone_number,:is_deleted)
  end
end
