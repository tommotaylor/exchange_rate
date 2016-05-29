require "csv"

c = CSV.read("#{Rails.root}/support/files/conversion_rates_2000.csv")
c.drop(5).each do |row|
  rate = {}
  rate[:date] = row[0].to_date
  rate[:rate] = BigDecimal(row[1])
  Rate.create(rate)
end

converter = ExchangeRateConverter.new
conversion = converter.convert(usd_amount: 113_000, date: 2.days.ago.to_date)
