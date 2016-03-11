class UsersController < ApplicationController

	get '/signup' do
		erb :'users/new', layout: false
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
			erb :'users/login', layout: false
		else
			redirect '/'
		end
	end	

	post '/login' do
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect to "/users/#{user.id}"
		else
			redirect to '/signup'
		end
	end

	get '/users/:id' do
		if !logged_in?
			redirect to '/login'
		end
		@user = User.find(params[:id])
		@current_user = current_user
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

	get '/logout' do
		if logged_in?
			session.destroy
		end
		redirect to '/'
	end

	get '/users/:id/edit' do 
		if !logged_in? || session[:user_id] != params[:id].to_i
			@error_message = "Cannot edit another user's information"
			redirect to "/users"
		else
			@user = User.find(params[:id])
			@neighborhoods = Neighborhood.all
			erb :'users/edit'
		end
	end

	post '/users/:id' do 
		@user = User.find(params[:id])
		@user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], neighborhood_id: params[:neighborhood_id])
		redirect to "/users/#{@user.id}"
	end

end
