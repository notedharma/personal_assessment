class ApplicationController < ActionController::Base
  # call require_valid_user! for every page
  before_action :require_valid_user!

  def current_user
    # if session user id is not nil
    if !session[:user_id].blank?
      # set @user to User.user_id
      @current_user ||= User.find(session[:user_id])
    end
  end

  def require_valid_user!
    if current_user.nil?
      flash[:error] = 'Please login to continue.'
      redirect_to login_path
    end
  end
end
