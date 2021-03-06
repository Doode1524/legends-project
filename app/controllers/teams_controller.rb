class TeamsController < ApplicationController

    get '/teams' do
        redirect_if_not_logged_in
        @teams = Team.all
        @team = Team.find_by_id(session[:team_id])
        @user = current_user
        erb :'/teams/index'
    end

    get '/teams/new' do
        redirect_if_not_logged_in 
        erb :'/teams/new'
    end

    get '/teams/:slug/edit' do
        find_team
        redirect_if_not_logged_in
        redirect_if_team_not_found
        redirect_if_not_team_owner
        erb :'teams/edit'
    end

    get '/teams/:slug' do
        redirect_if_not_logged_in
        find_team
        redirect_if_team_not_found
        erb :'/teams/show'
    end

    post '/teams' do
    
        if logged_in?
          if params[:team_name] == "" || params[:user][:champion_ids] == nil || params[:user][:champion_ids].length != 5 
            redirect to "/teams/new"
          else
            # @team = current_user.teams.build(team_name: params[:user][:team_name], champion_ids: params[:user][:champion_ids])
            @team = Team.create(team_name: params[:user][:team_name], champion_ids: params[:user][:champion_ids], user_id: current_user.id)
            if @team.save
              redirect to "/teams/#{@team.slug}"
            else
              redirect to "/teams/new"
            end
          end
        else
          redirect to '/login'
        end
      end


    patch '/teams/:slug' do
      
        find_team
        redirect_if_team_not_found
        redirect_if_not_team_owner
        if @team.update(params[:user])
            redirect "/teams/#{@team.slug}"
        else
            redirect "/teams/#{@team.slug}/edit"
        end
    end

    delete '/teams/:slug' do
        find_team
        redirect_if_not_team_owner
        if @team
            @team.destroy
            redirect "/teams"
        end
    end

    private
    def find_team
        @team = Team.find_by_slug(params[:slug])
    end
    
    def redirect_if_team_not_found
        redirect "/teams" unless @team
    end

    def redirect_if_not_team_owner
      redirect "/teams/#{@team.slug}" unless @team.user_id == current_user.id
    end
end
