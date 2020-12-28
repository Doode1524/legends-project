class Team < ActiveRecord::Base
    validates_presence_of :team_name

    belongs_to :user
    has_many :team_champions
    has_many :champions
end

