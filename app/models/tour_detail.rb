class TourDetail < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :bookings, dependent: :destroy
  validates :price, numericality:
   {greater_than_or_equal_to: Settings.minimum_price}
  validates :tour_total, numericality:
   {greater_than_or_equal_to: Settings.minimum_tour_total}
  validates :user_id, numericality:
   {greater_than_or_equal_to: Settings.positive}
  validates :tour_id, numericality:
    {
      greater_than_or_equal_to: Settings.positive,
      less_than_or_equal_to: Settings.maximum_tour_total
    }
  validate :validate

  def validate
    if time_start < Time.zone.now
      errors.add(:time_start, t("validate.validate_time"))
    end
    if time_end <= time_start
      errors.add(:time_end, t("validate.validate_time_end"))
    end
    true # never return false or the validation fails
  end
end
