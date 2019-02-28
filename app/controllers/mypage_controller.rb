class MypageController < ApplicationController
  
  include Recommend
  
  def index
    if @user.excharts.present?
      @exchart = @user.excharts.last
      gon.data = @exchart.data
      @recommended_patterns = three_recommended_patterns(gon.data)
    end
    @quotation = Quotation.find(quotation_seed)
  end
  
  def quotation_seed
    quotaions = Quotation.count
    date = Date.today
    seed = date.year + date.mon + date.day
    id = Random.new(seed).rand(1..quotaions)
    return id
  end
end
