class MypageController < ApplicationController
  def index
    @exchart = Exchart.find(1)
    gon.data = @exchart.data
    @patterns = Pattern.all.order(:pattern_no)
    gon.patterns = @patterns
    @recommended_patterns = @patterns.first(3)
  end
end
