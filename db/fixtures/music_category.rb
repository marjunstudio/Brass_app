require 'csv'

csv = CSV.read('db/fixtures/csv/music_category.csv', headers: true)
csv.each do |music_category|
  MusicCategory.seed do |s|
    s.id = music_category[0]
    s.music_id = music_category[1]
    s.category_id = music_category[2]
  end
end