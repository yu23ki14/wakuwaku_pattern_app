require 'csv'

csv = CSV.read('db/fixtures/patterns.csv')

csv.each_with_index do |patterns, i|
  # skip a label row
  next if i === 0

  pattern_index = patterns[1]
  pattern_id = patterns[2]
  pattern_name = patterns[3]
  summary = patterns[4]
  context = patterns[5]
  b_problem = patterns[6]
  problem = patterns[7]
  b_solution = patterns[8]
  solution = patterns[9]
  consequence = patterns[10]
  unit_no = patterns[11]
  category_id = patterns[12]
  pattern_group_id = patterns[13]

  Pattern.seed do |s|
    s.id   = i
    s.pattern_index = pattern_index
    s.pattern_id = pattern_id
    s.pattern_name = pattern_name
    s.summary = summary
    s.context = context
    s.b_problem= b_problem
    s.problem = problem
    s.b_solution = b_solution
    s.solution = solution
    s.consequence = consequence
    s.unit_no = unit_no
    s.category_id = category_id
    s.pattern_group_id = pattern_group_id
  end
end