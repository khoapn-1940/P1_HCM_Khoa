class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: [:update, :destroy]
  def index
    @users = User.order_by_time_desc.paginate(page: params[:page], per_page: 15)
  end

  def update
    @user.role = params[:role]
    if @user.save
      flash[:success] = t("controller.flash.update_role_successfully")
      respond_to do |format|
        format.html{redirect_to admin_users_path}
        format.js
      end
    else
      flash[:danger] = t("controller.flash.update_role_failed")
      redirect_to admin_users_path
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t("controller.flash.destroy_user_successfully")
      respond_to do |format|
        format.html{redirect_to admin_users_path}
        format.js
      end
    else
      flash[:danger] = destroy_user_failed
      redirect_to admin_users_path
    end
  end

  private

  def load_user
    @user = User.find_by_id params[:id]
    return true unless @user.nil?
    flash[:danger] = t("controller.flash.load_user_failed")
    redirect_to admin_users_path
  end
end
