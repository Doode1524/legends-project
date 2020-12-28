class ChampionsController < ApplicationController

    get '/champions' do
     
        # Champion.hash_champs.collect do |champ|
        #    @champs = champ["Name"]
        # end
        erb :'/champions/index'
    end

    get '/champions/:id' do
        find_champion
        erb :'champions/show'
    end

    private
    def find_champion
        @champ = Champion.find_by_id(params[:id])
    end

end