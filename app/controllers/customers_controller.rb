class CustomersController < ApplicationController
  def index
    @customers = Customer.includes(laundry_orders: :service).all
  end

  def new
    @customer = Customer.new
    @shoes = Shoe.all
    @services = Service.all
  end

  def create
    @customer = Customer.new(customer_params.except(:shoe_id, :service_id))

    if @customer.save
      # Buat LaundryOrder jika shoe & service dipilih
      if customer_params[:shoe_id].present? && customer_params[:service_id].present?
        LaundryOrder.create!(
          customer: @customer,
          shoe_id: customer_params[:shoe_id],
          service_id: customer_params[:service_id],
          status: "Menunggu"
        )
      end

      redirect_to customers_path, notice: "Customer & pesanan berhasil dibuat!"
    else
      @shoes = Shoe.all
      @services = Service.all
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone, :email, :address, :shoe_id, :service_id)
  end
end
         

