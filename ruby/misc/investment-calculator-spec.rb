require_relative './investment-calculator'

describe InvestmentCalculator do
  let!(:yearly_investment) { 1500 }
  let!(:interest) { 0.25 }
  subject { InvestmentCalculator.new(yearly_investment, interest) }

  context 'when it didnt start running' do
    it 'should have no value' do
      expect(subject.profit_for_years 0).to eq 0
    end
  end

  context 'when it only runs for 1 year' do
    it 'should have base investment + 1 years interest' do
      expect(subject.profit_for_years 1).to eq yearly_investment * (1 + interest)
    end
  end

  context 'when it runs for 2 year' do
    it 'should have complex profit' do
      expect(subject.profit_for_years 2).to eq (yearly_investment * (1 + interest) ** 2 + yearly_investment * (1 + interest))
    end
  end

end

