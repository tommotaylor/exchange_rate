feature "User creates a new conversion" do
  context "when date is a weekday" do
    let(:friday) { Date.today.beginning_of_week+4 }
    let!(:rate) do
      Fabricate :rate, date: friday, rate: BigDecimal.new("0.5000")
    end

    scenario "it creates the conversion" do
      visit new_conversion_path
      expect(page).to have_content("Create a new conversion")
      fill_in "conversion[date]", with: friday
      fill_in "conversion[usd_amount]", with: 10
      click_button "Create Conversion"

      conversion = Conversion.first

      expect(current_path).to eq(conversion_path(conversion))
      expect(page).to have_content("Your conversion was successful")
      expect(page).to have_content(conversion.usd_amount)
      expect(page).to have_content(conversion.euro_amount)
      expect(page).to have_content("Hire me!")
    end
  end
end
