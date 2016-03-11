class UsersController < ApplicationController

	get '/signup' do
		erb :'users/new'
	end

	post '/signup' do
		if params[:email] == "" || params[:password] == ""
			redirect to '/signup'
		else
			@user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
			session[:user_id] = @user.id
			redirect '/'
		end	
	end

	get '/login' do
		if !session[:user_id]
			erb :'users/login'
		else
			redirect '/'
		end
	end	

	post '/login' do
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect to '/users/#{user.id}'
		else
			redirect to '/signup'
		end
	end
=begin
	get '/logout'
		if session[:user_id] != nil
			session.destroy
		end
			redirect to '/'
	end
=end
	get '/users/:id' do
		if !logged_in?
			redirect to '/login'
		end

		@user = User.find(params[:id])
		erb :'users/show'
	end

	get '/users' do
		if !logged_in?
			redirect to '/login'
		else
			@users = User.all
			erb :'users/index'
		end
	end

end
