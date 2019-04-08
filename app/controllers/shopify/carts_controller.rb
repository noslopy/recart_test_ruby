class Shopify::CartsController < ApplicationController
  def update
    send(request.headers[:topic].sub('/', '_'))
  end

  private

  def carts_update
    shop = ShopifyShop.find_or_create_by(domain: request.headers[:domain])
    session = UserSession.find_by(session_id: params[:id], shopify_shop_id: shop.id)
    session = shop.user_sessions.new(session_id: params[:id]) if session.nil?
    session.item_count = params[:line_items].first[:quantity]
    session.value = params[:line_items].first[:line_price]
    session.save
  end

  def carts_create
    carts_update
  end
end
