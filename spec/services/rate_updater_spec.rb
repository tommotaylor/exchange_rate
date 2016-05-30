describe RateUpdater do
  let(:updater) { RateUpdater.new }

  it "creates Rates" do
    updater.update
    expect(Rate.count).to be > 4518
  end
end
