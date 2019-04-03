class UserSession < ApplicationRecord
  belongs_to :shopify_shop

  before_save :calculate_usd_value

  private

  def calculate_usd_value
    currency_calculator = \
      CurrencyCalculator.new(from: shopify_shop.currency, to: 'USD', value: value)
    self.value_usd = currency_calculator.calculate
  end
end
