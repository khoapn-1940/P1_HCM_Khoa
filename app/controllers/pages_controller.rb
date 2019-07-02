class PagesController < ApplicationController
  def home
    @tour_details = TourDetail.order_by_time_desc.paginate(
      page: params[:page],
      per_page: Settings.index_per_page
    )
  end
end
