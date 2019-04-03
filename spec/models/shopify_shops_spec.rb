require 'spec_helper'
require 'rails_helper'

RSpec.describe 'ShopifyShop' do
  it 'can be created' do
    shop = ShopifyShop.create(domain: 'my-patriotic-shop.com', currency: 'USD')
    expect(shop).to eq ShopifyShop.last
  end
end
