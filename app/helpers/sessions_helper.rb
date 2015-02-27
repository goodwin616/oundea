module SessionsHelper
	#logs in the given user
	def log_in(user)
		session[:room_code] = user.room_code
	end

	# Returns the current logged-in user (if any)
	def current_user 
		@current_user ||= User.find_by(room_code: session[:room_code])
	end

	#Returns true if the user is logged in
	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:room_code)
		@current_user = nil
	end


end
