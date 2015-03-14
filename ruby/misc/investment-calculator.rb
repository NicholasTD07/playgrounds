class InvestmentCalculator
  def initialize(yearly_investment, interest)
    @yearly_investment = yearly_investment
    @interest = interest
  end

  def profit_for_years(years)
    sum = 0

    (0...years).each do |year|
      interest = accumulative_interest_for_years(years - year)
      accumulative_profit_for_each_year = @yearly_investment * interest
      sum += accumulative_profit_for_each_year
    end

    sum
  end

  def accumulative_interest_for_years(years)
    ((1 + @interest) ** years)
  end

end

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

  context 'when it only runs for 2 year' do
    it 'should have complex profit' do
      expect(subject.profit_for_years 2).to eq (yearly_investment * (1 + interest) ** 2 + yearly_investment * (1 + interest))
    end
  end

end

# p InvestmentCalculator.new(18000, 10, 0.25).calculate
