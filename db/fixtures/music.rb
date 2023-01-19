# require 'csv'

# csv = CSV.read('db/fixtures/csv/music.csv', headers: true)
# csv.each do |music|
#   Music.seed do |s|
#     s.id = music[0]
#     s.title = music[1]
#     s.category_id = music[2]
#   end
# end