describe ExchangeRateConverter do
  let(:converter) { ExchangeRateConverter.new }
  let(:friday) { Date.today.beginning_of_week+4 }
  let!(:rate) do
    Fabricate :rate, date: friday, rate: BigDecimal.new("0.5000")
  end

  context "when the date is a weekday" do
    it "creates a conversion with the correct euro amount" do
      expect do
        result = converter.convert(usd_amount: 10, date: friday)
        expect(result.euro_amount).to eq(20)
      end.to change { Conversion.count }.by(1)
    end
  end

  context "when the date is a weekend" do
    let(:saturday) { Date.today.beginning_of_week+5 }

    it "uses the previous valid rate" do
      result = converter.convert(usd_amount: 10, date: saturday)
      expect(result.euro_amount).to eq(20)
      expect(result.rate).to eq(rate)
    end
  end
end
