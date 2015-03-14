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
