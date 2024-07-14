class ItemsController < ApplicationController
  def index
    @items = Item.all
    @basket = Basket.find_or_create_by(token: cookies[:basket_token])
    cookies[:basket_token] ||= @basket.token
  end

  def show
    @item = Item.find(params[:id])
    @basket = Basket.find_or_create_by(token: cookies[:basket_token])
    cookies[:basket_token] ||= @basket.token
  end
end