class ApplicationController < ActionController::Base
  add_flash_types :success, :messages, :alert, :notice
  # before_action :store_location

  def after_sign_in_path_for(resource)
    # previous_path = session[:previous_url]
    # session[:previous_url] = nil
    # previous_path || dashboard_lender_path
    if current_user.user_type == "Borrower"
      path = dashboard_borrower_path
    else
      path = dashboard_lender_path
    end
    stored_location_for(resource) || path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
#  this would save a path to redirect to - not working but incase Bodil needs code again
  # def store_location
  #   if(request.path != "/user/login" && !current_user)
  #     session[:previous_url] = request.fullpath
  #   end
  # end
end
