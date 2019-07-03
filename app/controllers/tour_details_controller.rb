class TourDetailsController < ApplicationController
  def new
    load_tour_details_data
    @reviews = @tour_detail.tour.reviews.order_by_time_desc.paginate(
      page: params[:page], per_page: Settings.tour_detail_reviews
    )
    @self_review = current_user.reviews.create(tour_id: params[:tour_id])
  end

  private
  def load_tour_details_data
    @tour_detail = TourDetail.find_by_id params[:tour_detail_id]
    @star = @tour_detail.tour.ratings.average(:star).to_i
    @booking_tour = current_user.bookings.create(
      tour_detail_id: params[:tour_detail_id]
    )
    @self_star = current_user.ratings.find_by(tour_id: params[:tour_id])
  end
end
