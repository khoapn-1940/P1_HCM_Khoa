class ManageUsersController < ApplicationController
  def new
    return unless User.roles[session[:role]] == User.roles[:admin]
    @user_all = User.all
  end
end
