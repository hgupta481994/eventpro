class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session
	before_action :check_profile

	def authenticate!
	  authenticate_user!
	end

	def timeout
    flash[:notice] = "Your session has timed out."
    redirect_to "/users/sign_in"
  end

  def check_profile
    if current_user && !current_user.is_admin?
			if current_user.try(:user_profile).present?
				return
			else
				respond_to do |format|
					format.html { redirect_to new_user_profile_path , notice: 'Please Complete your profile first.' }
				end				
			end
		end
	end
end
