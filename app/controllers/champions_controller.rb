class ChampionsController < ApplicationController

    get '/champions' do
     
        # Champion.hash_champs.collect do |champ|
        #    @champs = champ["Name"]
        # end
        erb :'/champions/index'
    end

end