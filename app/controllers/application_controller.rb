class ApplicationController < ActionController::Base
 	before_filter :login_required
  protect_from_forgery
	include CasAuthentication

	#Force signout to prevent CSRF Attacks
	def handle_unverified_request
		sign_out
		super
	end
end


