class Shopify::CartsController < ApplicationController
  def update
    send(request.headers[:topic].sub('/', '_'))
  end

  private

  def carts_update
    session = UserSession.find_by(id: params[:id])
    session.item_count = params[:line_items].first[:quantity]
    session.value = params[:line_items].first[:line_price]
    session.save
  end

  def carts_create
    carts_update
  end
end
