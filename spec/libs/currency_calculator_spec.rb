RSpec.describe 'CurrencyCalculator' do
  describe 'calculate' do
    it 'can show value in selected currency' do
      cc = CurrencyCalculator.new(from: 'USD', to: 'SEK', value: 5)
      expect(cc.calculate).to eq 5*9
    end
  end
end
