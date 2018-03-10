class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(params_customer)

    if @customer.save
      redirect_to customers_path, notice: 'Customer created!'
    else
      render :new
    end
  end

  private
    def params_customer
      params.require(:customer).permit(:id, :name, :email, :smoker, :phone, :avatar)
    end
end
