require 'csv'

csv = CSV.read('db/fixtures/pattern_group.csv')

csv.each_with_index do |pattern_group, i|
  # skip a label row
  next if i === 0

  name = pattern_group[1]
  category_id = pattern_group[2]

  PatternGroup.seed do |s|
    s.id   = i
    s.name = name
    s.category_id = category_id
  end
end