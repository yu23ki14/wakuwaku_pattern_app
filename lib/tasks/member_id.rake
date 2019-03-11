namespace :member do
  
  task :new do
    hashed_text = ""
    seed = ('A'..'z').to_a
    for i in 1..8
      hashed_text += seed[Random.new(240 + i).rand(seed.length)]
    end
  end

end