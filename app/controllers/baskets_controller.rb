class BasketsController < ApplicationController
  def show
  end
  
  # def add_to_basket
  #   item = Item.find(params[:item_id])
  #   @basket.basket_items.find_or_create_by(item: item)

  #   redirect_to items_path, notice: 'Item added to basket'
  # end
  
  def add_to_basket
    item = Item.find(params[:item_id])
    basket_item = @basket.basket_items.find_or_initialize_by(item: item)
    basket_item.quantity += params[:quantity].to_i
    basket_item.save

    redirect_to items_path, notice: 'Item added to basket'
  end

  def update_item_quantity
    basket_item = @basket.basket_items.find(params[:id])
    basket_item.update(quantity: params[:quantity])

    redirect_to basket_path(@basket), notice: 'Item quantity updated'
  end

  def remove_item
    basket_item = @basket.basket_items.find(params[:id])
    basket_item.destroy
    redirect_to basket_path(@basket), notice: 'Item removed from basket.'
  end

end
