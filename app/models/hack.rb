# class Hack < ActiveRecord::Base

#     @sums = []
#     @sum_total = []

#     def hack 
#         Champion.all.collect do |champ|
        
#             @sums <<  {:id =>champ.id,  :total => Hash[champ.attributes.except("Name",  "Title").sort_by{|k,v| -v}].values.sum}
#         end

#         @sums.collect do |i|
#             @sum_total << i.sum
#         end

#         top5 = @sum_total.sort.reverse
#         @
#         top5
#     end

#     array_of_hashes.sort_by { |hsh| hsh[:zip] }


#     total = Hash[@sums.map {|k,v|  [k, v]}]

#     total = Hash[@sums.map {|v|  [ v]}]



#     h3 = Hash[a3.map {|key, value| [key, value]}]
# puts "h3: #{h3.inspect}"

# end




# @sums = []
# Champion.all.each do |champ|
#     @sums <<  {:id =>champ.id,  :total => Hash[champ.attributes.except("Name", "id", "ChampionId", "Title").sort_by{|k,v| -v}].values.sum}
# end
# @sums.sort_by { |hsh| hsh[:total] }.reverse