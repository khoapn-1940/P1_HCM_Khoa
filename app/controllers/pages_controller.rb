class PagesController < ApplicationController
  def home
    @tour_details = TourDetail.order(created_at: :desc).paginate(page: params[:page],
     per_page: Settings.index_per_page)
  end
end
