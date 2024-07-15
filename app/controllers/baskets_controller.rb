class BasketsController < ApplicationController
  def show
  end
  
  def add_to_basket
    item = Item.find(params[:item_id])
    @basket.basket_items.find_or_create_by(item: item)

    redirect_to items_path, notice: 'Item added to basket'
  end

  def remove_item
    item = @basket.items.find(params[:id])
    @basket.items.delete(item)
    redirect_to basket_path(@basket), notice: 'Item removed from basket.'
  end
end
