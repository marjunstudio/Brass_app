require 'csv'

csv = CSV.read('db/fixtures/csv/music.csv', headers: true)
csv.each.with_index(1) do |music, index|
  Music.seed do |s|
    s.id = index
    s.title = music[0]
    s.composer_id = music[1]
    s.description = music[2]
  end
end