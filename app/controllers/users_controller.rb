class UsersController < ApplicationController

	get '/signup' do
		@error_message = params[:error]
		erb :'users/new', layout: false
	end

	post '/signup' do
		if params[:email] == "" || params[:password] == "" || params[:first_name] == "" || params[:last_name] == ""
			redirect to '/signup?error=Inputs invalid. Please try again'
		else
			@user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
			session[:user_id] = @user.id
			redirect '/'
		end	
	end

	get '/login' do
		@error_message = params[:error]
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
			redirect to '/login?error=Login information incorrect. Please try again'
		end
	end

	get '/users/:id' do
		redirect_if_not_logged_in
		@user = User.find(params[:id])
		@current_user = current_user
		erb :'users/show'
	end

	get '/users' do
		redirect_if_not_logged_in
		@error_message = params[:error]
		@users = User.all
		erb :'users/index'
	end

	get '/logout' do
		if logged_in?
			session.destroy
		end
		redirect to '/'
	end

	get '/users/:id/edit' do 
		redirect_if_not_logged_in
		if !logged_in? || session[:user_id] != params[:id].to_i
			redirect to "/users?error=Cannot edit another user's information"
		else
			@user = User.find(params[:id])
			@neighborhoods = Neighborhood.all
			@error_message = params[:error]
			erb :'users/edit'
		end
	end

	post '/users/:id' do 
		@user = User.find(params[:id])
		if params[:email] == "" || params[:password] == "" || params[:first_name] == "" || params[:last_name] == ""
			#binding.pry
			redirect to "users/#{@user.id}/edit?error=Inputs invalid Please input data for all fields"
		else
			@user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], neighborhood_id: params[:neighborhood_id])
			redirect to "/users/#{@user.id}"
		end
	end

end
