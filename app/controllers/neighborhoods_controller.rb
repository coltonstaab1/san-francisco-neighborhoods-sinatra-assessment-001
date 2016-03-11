class NeighborhoodsController < ApplicationController

  get '/neighborhoods' do
    if logged_in?
      @neighborhoods = Neighborhood.all
      erb :'neighborhoods/index'
    end
  end

end