class ChampionsController < ApplicationController

    get '/champions' do
        redirect_if_not_logged_in
       
        erb :'/champions/index'
      
    end
    
    get '/champions/:slug' do
        find_champion
        redirect_if_not_logged_in
        @stats = @champ.attributes.except("id")
        erb :'champions/show'
    end

    private
    def find_champion
        @champ = Champion.find_by_slug(params[:slug])
    end

end

