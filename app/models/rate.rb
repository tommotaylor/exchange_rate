class Rate < ApplicationRecord
  validates_presence_of :rate
  validates_presence_of :date
  validates_uniqueness_of :date

  has_many :conversions
end
