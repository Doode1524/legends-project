class DuelsController < ApplicationController

    get '/duels' do
        redirect_if_not_logged_in
        @teams = Team.all
        @team = Team.find_by_id(session[:team_id])
        @user = current_user
        erb :'/duels/home'
    end
    get '/duels/:id/new' do
        redirect_if_not_logged_in
        @user = current_user
        @teams = Team.all
        @team = Team.find_by_id(params[:id])
        erb :'/duels/new'
    end
      
    post '/duel' do
        @allied_values = []         
        @enemy_values = []         
        @enemy_team = Team.find_by_id(params[:enemy_team])         
        @allied_team = Team.find_by_id(params[:current_user_team])         
            @allied_team.champions.collect do |champ|             
                @allied_stats = champ.attributes.except("Name", "Title","id","ChampionId")         
            end         
            @enemy_team.champions.collect do |champ|             
                @enemy_stats = champ.attributes.except("Name", "Title","id","ChampionId")
            end        
            @allied_stats.each do |k,v|            
                @allied_values << v           
            end                 
            @enemy_stats.each do |k,v|             
                @enemy_values << v           
            end

            if @enemy_values.sum > @allied_values.sum
                @enemy_team.wins += 1
                @allied_team.losses += 1
                   
            elsif @enemy_values.sum < @allied_values.sum
                @enemy_team.losses += 1
                @allied_team.wins += 1
            end

            @enemy_team.save
            @allied_team.save
                 
            erb :'duels/duel'     
            binding.pry               
    end



    get '/duel' do
        redirect_if_not_logged_in
        erb :'duels/duel'
    end

end
