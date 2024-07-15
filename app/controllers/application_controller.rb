class ApplicationController < ActionController::Base
  before_action :set_basket

  private

  def set_basket
    @basket = Basket.find_or_create_by(token: cookies[:basket_token])
    cookies[:basket_token] ||= @basket.token
  end
end
