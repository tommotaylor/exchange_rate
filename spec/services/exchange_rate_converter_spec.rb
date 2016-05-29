describe ExchangeRateConverter do
  let(:converter) { ExchangeRateConverter.new }
  let!(:rate) do
    Fabricate :rate, date: 2.days.ago.to_date, rate: BigDecimal.new("0.5000")
  end

  context "when the date is a weekday" do
    it "creates a conversion with the correct euro amount" do
      expect do
        result = converter.convert(usd_amount: 10, date: 2.days.ago.to_date)
        expect(result).to be_success
        expect(result.conversion.euro_amount).to eq(20)
      end.to change { Conversion.count }.by(1)
    end
  end

  context "when the date is a weekend" do
    "it uses the previous valid rate"
  end
end
