describe Rate do
  it { should have_many (:conversions) }
  it { should validate_presence_of (:rate) }
  it { should validate_presence_of (:date) }
  it { should validate_uniqueness_of (:date) }
end

