require 'csv'

csv = CSV.read('db/fixtures/categories.csv')

csv.each_with_index do |categories, i|
  # skip a label row
  next if i === 0

  name = categories[1]
  short_name = categories[2]

  Category.seed do |s|
    s.id   = i
    s.name = name
    s.short_name = short_name
  end
end