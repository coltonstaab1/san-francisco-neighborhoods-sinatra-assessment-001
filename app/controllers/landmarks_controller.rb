class LandmarksController < ApplicationController

  get '/landmarks' do 
    if logged_in?
      @landmarks = Landmark.all
      erb :'landmarks/index'
    else
      redirect to '/login'
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