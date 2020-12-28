class TeamChampion < ActiveRecord::Base
    belongs_to :champions
    belongs_to :team
end