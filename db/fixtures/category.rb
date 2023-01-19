# require 'csv'

# csv = CSV.read('db/fixtures/csv/category.csv', headers: true)
# csv.each do |category|
#   Category.seed do |s|
#     s.id = category[0] # ここではid
#     s.name = category[1] # ここではname
#   end
# end