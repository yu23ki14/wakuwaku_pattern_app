class MypageController < ApplicationController
  
  include Recommend
  
  def index
    if @user.excharts.present?
      @exchart = @user.excharts.last
      gon.data = @exchart.data
      gon.recommended_patterns_id = three_recommended_patterns(gon.data)
      @recommended_patterns = Pattern.where(id: gon.recommended_patterns_id)
    end
    @quotation = Quote.find(quotation_seed)
  end
  
  def quotation_seed
    quotaions = Quote.count
    date = Date.today
    seed = date.year + date.mon + date.day
    id = Random.new(seed).rand(1..quotaions)
    return id
  end
end
