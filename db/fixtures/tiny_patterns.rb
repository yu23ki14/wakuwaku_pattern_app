require 'csv'

csv = CSV.read('db/fixtures/tiny_patterns.csv')

csv.each_with_index do |patterns, i|
  # skip a label row
  next if i === 0

  pattern_no = patterns[1]
  pattern_name = patterns[2]
  solution = patterns[3]
  pattern_id = patterns[4]

  TinyPattern.seed do |s|
    s.id   = i
    s.pattern_no = pattern_no
    s.name = pattern_name
    s.solution = solution
    s.pattern_id = pattern_id
  end
end