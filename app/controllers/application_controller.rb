require './config/environment'

class ApplicationController < Sinatra::Base

	configure do
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "ilovethisapp"
	end

	get '/' do
		if !logged_in?
			erb :index, layout: false
		else
			redirect to '/users'
		end
	end

	helpers do 
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end

		def redirect_if_not_logged_in
			if !logged_in?
				redirect '/login?error=Please log in'
			end
		end
	end

end
