class ExchangeRateConverter
  def convert(usd_amount:, date:)
    date = date.end_of_week-2 if date.saturday? || date.sunday?
    rate_object = Rate.find_by(date: date)
    euro_amount = usd_amount / rate_object.rate

    @conversion = Conversion.create(
      usd_amount: usd_amount,
      euro_amount: euro_amount.to_i,
      date: date,
      rate: rate_object
    )
  end
end
