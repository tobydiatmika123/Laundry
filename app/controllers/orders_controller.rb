class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy finish]

  # GET /orders
  def index
    @orders = Order.includes(:customer, :shoe, :service).all
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  def create
    customer = Customer.find_or_create_by(
      name: params[:customer_name],
      email: params[:customer_email],
      phone: params[:customer_phone],
      address: params[:customer_address]
    )

    shoe = Shoe.create(
      brand: params[:shoe_brand],
      color: params[:shoe_color],
      size: params[:shoe_size],
      material: params[:shoe_material],
      condition: params[:shoe_condition]
    )

    @order = Order.new(
      shoe: shoe,  # 🔥 ini biar order langsung nyambung ke sepatu
      service_id: params[:service_id],
      status: "Proses"
    )

    @order.total_price = @order.service.price if @order.service

    if @order.save
      redirect_to orders_path, notice: "Order berhasil dibuat!"
    else
      flash.now[:alert] = @order.errors.full_messages.to_sentence
      render :new
    end
  end

  # GET /orders/:id
  def show; end

  # GET /orders/:id/edit
  def edit; end

  # PATCH/PUT /orders/:id
  def update
    if @order.update(order_params)
      redirect_to orders_path, notice: "Order berhasil diperbarui!"
    else
      render :edit
    end
  end

  # DELETE /orders/:id
  def destroy
    @order.destroy
    redirect_to orders_path, notice: "Order berhasil dihapus!"
  end

  # PATCH /orders/:id/finish
  def finish
    if @order.update(status: "Selesai")
      redirect_to orders_path, notice: "Order ditandai selesai."
    else
      redirect_to orders_path, alert: "Gagal menandai order selesai."
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_id, :shoe_id, :service_id, :status, :total_price)
  end
end
