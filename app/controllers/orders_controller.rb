class OrdersController < ApplicationController
  before_action :move_to_index_not_signed
  before_action :move_to_index_owner
  before_action :set_item

  def index
    @shipping_address = ShippingAddressBuyer.new
  end

  def create
    @shipping_address = ShippingAddressBuyer.new(shipping_address_params)
    if @shipping_address.valid? && params[:token].present?
      pay_item
      @shipping_address.save
      @item.update(buyer_id: current_user.id)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def shipping_address_params
    params.require(
      :shipping_address_buyer
    ).permit(
      :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
    ).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index_owner
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif @item.buyer_id.present?
      redirect_to root_path
    end
  end

  def move_to_index_not_signed
    redirect_to root_path unless user_signed_in?
  end
end 