class Admin::ToursController < Admin::BaseController
  def new
    @tour = current_user.tours.build(category_id: params[:id])
  end

  def index
    @tour = Tour.order_by_time_desc.paginate(page: params[:page], per_page: 15)
  end

  def create
    @tour = current_user.tours.create(tour_params)
    if @tour.save
      flash[:success] = t("controller.flash.create_tour_successfully")
      redirect_to admin_tours_path
    else
      render :new
    end
  end

  def destroy
    @tour_destroy = Tour.find_by_id params[:id]
    if @tour_destroy.destroy
      flash[:success] = t("controller.flash.delete_tour_successfully")
    else
      flash[:danger] = t("controller.flash.delete_tour_failed")
    end
    redirect_to admin_tours_path
  end

  private

  def tour_params
    params.require(:tour).permit(
      :name, :description, :user_id, :category_id, :image
    )
  end
end
