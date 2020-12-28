
class Champion < ActiveRecord::Base
    
    belongs_to :team

    # Api.load_data
    
    # def stats
    # puts "@champ.Attack
    #      @champ.Defense
    #      @champ.Magic
    #      @champ.Difficulty
    #      @champ.Hp
    #      @champ.HpUpPerLevel
    #      @champ.Mp
    #      @champ.MpUpPerLevel
    #      @champ.MoveSpeed
    #      @champ.Armor
    #      @champ.ArmorPerLevel
    #      @champ.SpellBlock
    #      @champ.SpellBlockPerLevel
    #      @champ.AttackRange
    #      @champ.HpRegen
    #      @champ.HpRegenPerLevel
    #      @champ.MpRegen
    #      @champ.MpRegenPerLevel
    #      @champ.AttackDamage
    #      @champ.AttackDamagePerLevel
    #      @champ.AttackSpeedOffset
    #      @champ.ChampionId
    #      @champ.Name
    #      @champ.Title
    #      @champ.team_id "
    # end       
    # def self.hash_champs
    #     Champion.all.collect do |champ|
    #         champ.attributes
    #     end
    # end
 
end