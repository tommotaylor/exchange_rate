require "open-uri"
require "csv"

class RatesController < ApplicationController
  def create
    uri = "http://sdw.ecb.europa.eu/export.do?type=&trans=N&node=2018794&CURRENCY=USD&FREQ=D&start=01-01-2012&q=&submitOptions.y=6&submitOptions.x=51&sfl1=4&end=&SERIES_KEY=120.EXR.D.USD.EUR.SP00.A&sfl3=4&DATASET=0"

    c = CSV.read(open(uri))
    c.drop(5).each do |row|
      rate = {}
      rate[:date] = row[0].to_date
      rate[:rate] = BigDecimal.new(row[1])
      Rate.create(rate)
    end
  end
end
