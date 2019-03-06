module Recommend
  extend ActiveSupport::Concern

  def three_recommended_patterns(chart_data)
    recommended_patterns_id = []
    unpractice_patterns = [*1..40] - JSON.parse(chart_data).select{|key,value| value > 0 }.keys().map(&:to_i) - [1, 11, 21, 31]
    grouped_patterns = unpractice_patterns.group_by do |data|
      if data <= 10
        1
      elsif data <= 20
        2
      elsif data <= 30
        3
      elsif data <= 40
        4
      end
    end
    grouped_patterns = grouped_patterns.sort {|(k1, v1), (k2, v2)| v2.length <=> v1.length }
    grouped_patterns = grouped_patterns.first(3)
    grouped_patterns.each do |group|
      recommended_patterns_id.push(group[1][0])
    end
    return recommended_patterns_id
  end

end