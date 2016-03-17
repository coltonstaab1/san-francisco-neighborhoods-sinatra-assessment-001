class LandmarksController < ApplicationController

  get '/landmarks' do 
    if logged_in?
      @neighborhoods = Neighborhood.all
      @landmarks = Landmark.all
      erb :'landmarks/index'
    else
      redirect to '/login'
    end
  end

  get '/landmarks/new' do
    if logged_in?
      @neighborhoods = Neighborhood.all
      binding.pry
      erb :'landmarks/new'
    else
      redirect to '/login'
    end
  end

  get '/landmarks/:id/edit' do
    redirect_if_not_logged_in
    @landmark = Landmark.find(params[:id])
    @neighborhoods = Neighborhood.all
    erb :'landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:name], address: params[:address], landmark_type: params[:landmark_type], neighborhood_id: params[:neighborhood_id])
    redirect '/landmarks'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:name], address: params[:address], landmark_type: params[:landmark_type], neighborhood_id: params[:neighborhood_id])
    binding.pry
    redirect to "/landmarks/#{@landmark.id}"
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