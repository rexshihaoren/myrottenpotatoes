class SessionsController < ApplicationController
	skip_before_filter :set_current_user
	def create
		auth = request.env["omniauth.auth"]
		#if you seen this provider with this uid before || new user
		user=Moviegoer.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Moviegoer.create_with_omniauth(auth) 
		session[:user_id]=user.id
		redirect_to movies_path
	end

	def destroy
		session.delete(:user_id)
		flash[:user_id] = 'Logged out successfully.'
		redirect_to movies_path
	end

	def failure
		raise params.inspect
	end

end
