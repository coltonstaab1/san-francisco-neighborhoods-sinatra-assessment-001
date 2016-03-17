class LandmarksController < ApplicationController

  get '/landmarks' do 
    if logged_in?
      @neighborhoods = Neighborhood.all
      @landmarks = Landmark.all
      @error_message = params[:error]
      erb :'landmarks/index'
    else
      redirect to '/login'
    end
  end

  get '/landmarks/new' do
    if logged_in?
      @neighborhoods = Neighborhood.all
      @user = User.find(session[:user_id])
      erb :'landmarks/new'
    else
      redirect to '/login'
    end
  end

  get '/landmarks/:id/edit' do
    redirect_if_not_logged_in
    @landmark = Landmark.find(params[:id])
    if @landmark.created_by != session[:user_id]
      redirect to '/landmarks?error=You cannot edit a landmark you did not create'
    else
      @neighborhoods = Neighborhood.all
      erb :'landmarks/edit'
    end
  end

  post '/landmarks' do
    if params[:name] == ""
      redirect '/landmarks/new?error=Please give this landmark a name'
    else
      @landmark = Landmark.create(name: params[:name], address: params[:address], landmark_type: params[:landmark_type], neighborhood_id: params[:neighborhood_id], created_by: params[:created_by])
      redirect '/landmarks'
    end
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    if params[:name] == ""
      redirect to '/landmarks/#{@landmark.id}/edit?error=Please give this landmark a name'
    else
      @landmark.update(name: params[:name], address: params[:address], landmark_type: params[:landmark_type], neighborhood_id: params[:neighborhood_id])
      binding.pry
      redirect to "/landmarks/#{@landmark.id}"
    end
  end

  get '/landmarks/:id' do
    if logged_in?
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
    else
      redirect to '/login'
    end
  end

end