require 'csv'

csv = CSV.read('db/fixtures/csv/category.csv', headers: true)
  csv.each do |category|
    Category.seed do |s|
      s.id = category[0] # ここではid
      s.name = category[1] # ここではname
  end
end

csv = CSV.read('db/fixtures/csv/music.csv', headers: true)
csv.each do |music|
  Music.seed do |s|
    s.id = music[0]
    s.title = music[1]
    s.category_id = music[2]
  end
end

csv = CSV.read('db/fixtures/csv/music_category.csv', headers: true)
csv.each do |id|
  MusicCategory.seed do |s|
    s.id = id[0]
    s.music_id = id[1]
    s.category_id = id[2]
  end
end