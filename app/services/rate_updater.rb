require "open-uri"
require "csv"
require "net/http"

class RateUpdater
  def update
    uri = construct_query
    c = CSV.read(open(uri))
    c.drop(5).each do |row|
      rate = {}
      rate[:date] = row[0].to_date
      rate[:rate] = BigDecimal.new(row[1])
      Rate.create(rate)
    end
  end

  private

  def construct_query
    date = Date.today.strftime("%d-%m-%Y")
    uri = URI("http://sdw.ecb.europa.eu/export.do")
    params = {
      type: nil,
      trans: "N",
      node: 2018794,
      CURRENCY: "USD",
      FREQ: "D",
      start: date,
      q: nil,
      end: nil,
      SERIES_KEY: "120.EXR.D.USD.EUR.SP00.A",
      sfl3: 4,
      DATASET: 0
    }
    uri.query = URI.encode_www_form(params)
    uri.to_s
  end
end
