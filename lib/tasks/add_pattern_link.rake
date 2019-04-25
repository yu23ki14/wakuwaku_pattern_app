namespace :add_pattern_link do
  
  task :category => :environment do
    categories = Category.all
    patterns = Pattern.all
    categories.each do |category|
      description = category.description
      patterns.each do |pattern|
        id = pattern.id
        pattern_name = pattern.pattern_name
        description = description.gsub(pattern_name, "<a href='/patterns/#{id}'>#{pattern_name}</a>")
      end
      category.update(description: description)
    end
  end
  
  task :pattern => :environment do
    patterns = Pattern.all
    patterns.each do |pattern|
      tiny_patterns = pattern.tiny_patterns
      
      context = pattern.context
      b_problem = pattern.b_problem
      problem = pattern.problem
      b_solution = pattern.b_solution
      solution = pattern.solution
      consequence = pattern.consequence
      
      tiny_patterns.each do |tiny_pattern|
        id = tiny_pattern.id
        tiny_pattern_name = tiny_pattern.name
        solution = solution.gsub(tiny_pattern_name, "<a href='#tiny-pattern-modal' class='js-trigger-tiny-pattern-modal' tiny_id='#{id}'>#{tiny_pattern_name}</a>")
      end
      
      patterns.each do |p|
        id = p.id
        pattern_name = p.pattern_name
        
        context = context.gsub(pattern_name, "<a href='/patterns/#{id}'>#{pattern_name}</a>")
        b_problem = b_problem.gsub(pattern_name, "<a href='/patterns/#{id}'>#{pattern_name}</a>")
        problem = problem.gsub(pattern_name, "<a href='/patterns/#{id}'>#{pattern_name}</a>")
        b_solution = b_solution.gsub(pattern_name, "<a href='/patterns/#{id}'>#{pattern_name}</a>")
        solution = solution.gsub(pattern_name, "<a href='/patterns/#{id}'>#{pattern_name}</a>")
        consequence = consequence.gsub(pattern_name, "<a href='/patterns/#{id}'>#{pattern_name}</a>")
      end
      pattern.update(context: context, b_problem: b_problem, problem: problem, b_solution: b_solution, solution: solution, consequence: consequence)
    end
  end
 
end