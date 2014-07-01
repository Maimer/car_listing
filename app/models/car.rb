class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :color, presence: true
  validates :mileage, presence: true, numericality: {
            greater_than_or_equal_to: 0
            }, allow_nil: false
  validates :year, presence: true, numericality: {
            greater_than_or_equal_to: 1920,
            less_than_or_equal_to: (Time.now.year + 1)
            }, allow_nil: false
  validates :manufacturer_id, presence: true
end
