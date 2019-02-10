require 'csv'

csv = CSV.read('db/fixtures/patterns.csv')

csv.each_with_index do |patterns, i|
  # skip a label row
  next if i === 0

  pattern_no = patterns[1]
  pattern_name = patterns[2]
  summary = patterns[3]
  context = patterns[4]
  b_problem = patterns[5]
  problem = patterns[6]
  b_solution = patterns[7]
  solution = patterns[8]
  consequence = patterns[9]
  unit_no = patterns[10]
  category_id = patterns[11]
  pattern_group_id = patterns[12]

  Pattern.seed do |s|
    s.id   = i
    s.pattern_no = pattern_no
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