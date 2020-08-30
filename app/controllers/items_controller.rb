class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :find_params_id, except: [:index, :new, :create]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :category_id, :name, :explanation, :price, :condition_id, :pay_postage_id, :prefecture_id, :shipping_date_id
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def find_params_id
    @item = Item.find(params[:id])
  end
end
