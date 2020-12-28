
class Champion < ActiveRecord::Base
    
    belongs_to :team

    # Api.load_data     

    # def self.hash_champs
    #     Champion.all.collect do |champ|
    #         champ.attributes
    #     end
    # end
 
end