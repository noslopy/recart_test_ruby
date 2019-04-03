RSpec.describe 'UserSession' do
  it 'can be created' do
    shop = ShopifyShop.create(domain: 'my-patriotic-shop.com', currency: 'USD')
    session = shop.user_sessions.create(value: 50, item_count: 1)
    expect(session).to eq UserSession.last
    expect(session.value_usd).to eq 50
  end
end
