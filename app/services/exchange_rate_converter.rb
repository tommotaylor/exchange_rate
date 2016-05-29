class ExchangeRateConverter

  attr_reader :conversion

  def initialize(conversion = nil)
    @conversion = conversion
  end

  def convert(usd_amount:, date:)
    rate_object = Rate.find_by(date: date)
    euro_amount = usd_amount / rate_object.rate
    conversion = Conversion.create(
      usd_amount: usd_amount,
      euro_amount: euro_amount.to_i,
      date: date,
      rate: rate_object
    )
    ExchangeRateConverter.new(conversion)
  end

  def success?
    conversion.present?
  end
end
