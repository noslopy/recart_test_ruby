class ShopifyShop < ApplicationRecord
  has_many :user_sessions

  validates :domain, :currency, presence: true
end
