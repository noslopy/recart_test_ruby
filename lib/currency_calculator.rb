class CurrencyCalculator
  def initialize(params = {})
   @from = params[:from]
   @to = params[:to]
   @value = params[:value]
  end

  def calculate
    values_in_usd = {
      USD: 1,
      HUF: 286,
      SEK: 9
    }
    @value / values_in_usd[@from.to_sym] * values_in_usd[@to.to_sym]
  end
end
