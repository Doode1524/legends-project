class DuelsController < ApplicationController

    get '/duels' do
        redirect_if_not_logged_in
        @teams = Team.all
        @team = Team.find_by_id(session[:team_id])
        @user = current_user
        erb :'/duels/home'
    end
    get '/duels/:slug/new' do
        redirect_if_not_logged_in
        @user = current_user
        @teams = Team.all
        @team = Team.find_by_slug(params[:slug])
        if @team == nil
            redirect '/users'
        end
        
        erb :'/duels/new'
    end
    
    post '/duel' do
        @allied_values = []         
        @enemy_values = []         
        
        @enemy_team = Team.find_by_id(params[:enemy_team])         
        @allied_team = Team.find_by_id(params[:current_user_team])
        if @allied_team == nil
            redirect '/users'
        end

        if current_user.id == @enemy_team.user_id
            redirect "/users"
        else         
            @allied_team.champions.each do |champ|             
                @allied_values << {:id =>champ.id,  :total => Hash[champ.attributes.except("Name", "ChampionId", "id",  "Title").sort_by{|k,v| -v}].values.sum}
            @allied_totals = @allied_values.sum { |hsh| hsh[:total] }     
            end         
            @enemy_team.champions.each do |champ|             
                @enemy_values << {:id =>champ.id,  :total => Hash[champ.attributes.except("Name", "ChampionId", "id",  "Title").sort_by{|k,v| -v}].values.sum}
            @enemy_totals = @enemy_values.sum { |hsh| hsh[:total] }    
            end     
            
            
            if @enemy_totals > @allied_totals
                @enemy_team.wins += 1
                @allied_team.losses += 1
                
            elsif @enemy_totals < @allied_totals
                @enemy_team.losses += 1
                @allied_team.wins += 1
                
            end
            
            @enemy_team.save
            @allied_team.save
            
            erb :'duels/duel'
        end     
        
    end
    
    get '/duel' do
        redirect_if_not_logged_in
        erb :'duels/duel'
    end
    
    def slug
        team_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
    
    def self.find_by_slug(slug)
        Team.all.find{|team| team.slug == slug}
    end
    
end
