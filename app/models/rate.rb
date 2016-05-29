class Rate < ApplicationRecord
  validates_presence_of :rate
  validates_presence_of :date

  has_many :conversions
end
