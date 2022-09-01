class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_user.user_type == "lender"
      path = dashboard_lender_path
    else
      path = dashboard_borrower_path
    end

    stored_location_for(resource) || path
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || new_user_session_path
  end
end
