require 'csv'

csv = CSV.read('db/fixtures/csv/composer.csv', headers: true)
  csv.each do |composer|
    Composer.seed do |s|
      s.id = composer[0]
      s.composer = composer[1]
  end
end