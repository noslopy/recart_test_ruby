# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ShopifyShop.create(domain: 'my-patriotic-shop.com', currency: 'USD')
ShopifyShop.create(domain: 'my-cool-shop.hu', currency: 'HUF')
ShopifyShop.create(domain: 'my-fancy-shop.se', currency: 'SEK')

ShopifyShop.all.each do |shop|
  shop.user_sessions.create(value: 100, item_count: 3)
end
