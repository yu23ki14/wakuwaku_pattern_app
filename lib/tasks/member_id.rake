namespace :member do
  
  task :new => :environment do
    #response = RestClient::Request.execute(
    #method: :get,
    #url: 'https://kosakayuji.com/wakubi/api_pattern_app_1903/?key=fdsfjklawekjbDJKF'
    #)
    #
    #p response
    
    response = ["1001", "1002", "M2001", "M2002"]
    
    response.each do |id|
      
      length = id.length
      int_id = "" 
      seed = ('a'..'z').to_a + ('A'..'Z').to_a
      hashed_text = ""
      
      length.times do |index|
        char = id[index]
        if seed.include?(char)
          num = seed.find_index(char)
          int_id += num.to_s
        else
          int_id += char
        end
      end
      
      for i in 1..8
        hashed_text += seed[Random.new(int_id.to_i + int_id.to_i * i).rand(seed.length)]
      end
      
      p [id, hashed_text]
      
      if !Member.find_by(member_id: id)
        Member.create(member_id: id, hashed_id: hashed_text)
      end
    end
  end
  
  task :delete => :environment do
    all = Member.all
    response = ["1001", "1002", "M2001"]
    
    all.each do |member|
      if !response.include?(member.member_id)
        member.destroy
      end
    end
  end
end