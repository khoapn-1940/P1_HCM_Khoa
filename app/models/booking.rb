class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour_detail
  has_many :payments, dependent: :destroy
  scope :order_by_time_desc, ->{order(created_at: :desc)}  
  validates :book_total, numericality:
    {
      greater_than_or_equal_to: Settings.positive,
      less_than_or_equal_to: Settings.maximum_book_total
    }
  validates :tour_detail_id, numericality:
    {greater_than_or_equal_to: Settings.positive}
end
