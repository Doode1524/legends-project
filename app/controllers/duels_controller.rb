class DuelsController < ApplicationController

    get '/duels' do
        @teams = Team.all
        @team = Team.find_by_id(session[:team_id])
        @user = current_user
        erb :'/duels/home'
    end

    get '/duels/4' do
        "Hello World"
      end


end