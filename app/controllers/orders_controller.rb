class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_sold_out
  before_action :redirect_if_seller, only: [:index, :create]



  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end
  
# OrdersController
def create
  @order_address = OrderAddress.new(order_params)

  if @order_address.valid?
    begin
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    rescue Payjp::InvalidRequestError => e
      flash[:alert] = "決済に失敗しました。もう一度お試しください。"
      redirect_to item_orders_path(@item)
    end
  else
    flash[:alert] = @order_address.errors.full_messages.join(', ')
    redirect_to item_orders_path(@item)
  end
end

  
  private

  def order_params
    params.require(:order_address).permit(
      :post_code, :prefecture_id, :city, :address,
      :building_name, :phone_number
    ).merge(
      user_id: current_user.id,
      item_id: params[:item_id],
      token: params[:token]  
    )
  end
  
  def redirect_if_seller
    redirect_to root_path if @item.user_id == current_user.id
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

  
def redirect_if_sold_out
  redirect_to root_path if @item.order.present?
end


end 
