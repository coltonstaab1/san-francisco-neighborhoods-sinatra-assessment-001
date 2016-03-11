class NeighborhoodsController < ApplicationController

  get '/neighborhoods' do
    if logged_in?
      @neighborhoods = Neighborhood.all
      erb :'neighborhoods/index'
    end
  end

  get '/neighborhoods/:id' do
    @neighborhood =  Neighborhood.find(params[:id])
    erb :"/neighborhoods/show"
  end

  get '/neighborhoods/new' do
    redirect_if_not_logged_in
  end

end