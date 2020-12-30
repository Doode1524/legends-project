class DuelsController < ApplicationController

    get '/duels' do
        @teams = Team.all
        @team = Team.find_by_id(session[:team_id])
        @user = current_user
        erb :'/duels/home'
    end
    get '/duels/:id/new' do
        @user = current_user
        @teams = Team.all
        @team = Team.find_by_id(params[:id])
        erb :'/duels/new'
    end
      
    post '/duel' do
        redirect to '/duel'
    end

    get '/duel' do
        erb :'duels/duel'
      end

end