class NeighborhoodsController < ApplicationController

  get '/neighborhoods' do
    if logged_in?
      @neighborhoods = Neighborhood.all
      erb :'neighborhoods/index'
    end
  end

  get '/neighborhoods/new' do
    redirect_if_not_logged_in
    @user = User.find(session[:user_id])
    erb :'/neighborhoods/new'
  end

  get '/neighborhoods/:id' do
    @neighborhood =  Neighborhood.find(params[:id])
    erb :"/neighborhoods/show"
  end

  post "/neighborhoods" do
    @neighborhood = Neighborhood.create(name: params[:name], number_inhabitants: params[:number_inhabitants], year_founded: params[:year_founded], created_by: params[:created_by])
    redirect  '/neighborhoods'
  end


end