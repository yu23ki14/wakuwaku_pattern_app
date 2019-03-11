require 'csv'

csv = CSV.read('db/fixtures/quotes.csv')

csv.each_with_index do |quotations, i|
  # skip a label row
  next if i === 0

  content = quotations[1]
  pattern_id = quotations[2]

  Quote.seed do |s|
    s.id   = i
    s.content = content
    s.pattern_id = pattern_id
  end
end