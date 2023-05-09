require 'csv'

csv = CSV.read('db/fixtures/csv/music_category.csv', headers: true)
csv.each.with_index(1) do |music_category, index|
  MusicCategory.seed do |s|
    s.id = index
    s.music_id = music_category[0]
    s.category_id = music_category[1]
  end
end