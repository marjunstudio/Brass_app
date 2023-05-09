require 'csv'

csv = CSV.read('db/fixtures/csv/composer.csv', headers: true)
  csv.each.with_index(1) do |composer, index|
    Composer.seed do |s|
      s.id = index
      s.composer = composer[0]
  end
end