class BasketsController < ApplicationController
  before_action :set_basket
  def show
    # set_basket initialises @basket
  end
  
  def add_to_basket
    item = Item.find(params[:item_id])
    @basket.basket_items.find_or_create_by(item: item)

    redirect_to items_path, notice: 'Item added to basket'
  end

  private

  def set_basket
    @basket = Basket.find_or_create_by(token: cookies[:basket_token])
    cookies[:basket_token] ||= @basket.token
  end
end
