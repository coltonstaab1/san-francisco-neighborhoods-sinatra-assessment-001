class LandmarksController < ApplicationController

  get '/landmarks' do 
    if logged_in?
      @landmarks = Landmark.all
      erb :'landmarks/index'
    else
      redirect to '/login'
    end
  end

end