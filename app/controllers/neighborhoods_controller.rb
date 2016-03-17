class NeighborhoodsController < ApplicationController

  get '/neighborhoods' do
    if logged_in?
      @neighborhoods = Neighborhood.all
      @error_message = params[:error]
      erb :'neighborhoods/index'
    end
  end

  get '/neighborhoods/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @user = User.find(session[:user_id])
    erb :'/neighborhoods/new'
  end

  get '/neighborhoods/:id' do
    @neighborhood =  Neighborhood.find(params[:id])
    @user_id = session[:user_id].to_i
    erb :"/neighborhoods/show"
  end

  post "/neighborhoods" do
    if params[:name] == ""
      redirect to "/neighborhoods/new?error=Please input a name for this neighborhood"
    else
      @neighborhood = Neighborhood.create(name: params[:name], number_inhabitants: params[:number_inhabitants], year_founded: params[:year_founded], created_by: params[:created_by])
      redirect  '/neighborhoods'
    end
  end

  get '/neighborhoods/:id/edit' do 
    redirect_if_not_logged_in
    @neighborhood = Neighborhood.find(params[:id])
    if @neighborhood.created_by != session[:user_id]
      redirect to '/neighborhoods?error=You cannot edit a neighborhood you did not create'
    else
      erb :'/neighborhoods/edit'
    end
  end

  post '/neighborhoods/:id' do
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.update(name: params[:name], number_inhabitants: params[:number_inhabitants], year_founded: params[:year_founded], created_by: params[:created_by])
    redirect to "/neighborhoods/#{@neighborhood.id}"
  end

end