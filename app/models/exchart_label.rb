class ExchartLabel < ApplicationRecord
  #this is sample code for create chartlabel
  #update exchart_labels set label_ja = E'コア,学びはじめ,実践での学び,学びの\n連鎖,鍛錬,実行力,発想,創造,仕上げ,学びの\n仲間,他者と\n関る,自省,突き抜け' where language_id = 1
  #update exchart_labels set label_ja = E'コア,勢いをもつ,まとまり,積極性,深い絆,創造の環境,発見の連鎖,実現へ加速,こだわり,つくり込み,継続の力' where language_id = 2
  #update exchart_labels set label_ja = E'コア,認識の共有,魅力的な\n展開,仕上げ,実感を\n生む工夫,つくり込み,能動性の誘発,準備,語り手,つながり,究極' where language_id = 3

  #update exchart_labels set label_en = E'Core,Begining,Practical\nlearning,Chain\nlearning,Drill,Action,Imagination,Creativity,Finishing,Fellow,Influence,Reflection,Uniqueness' where language_id = 1
  #update exchart_labels set label_en = E'Core,Dynamic,Unity,Activeness,Bond,Environment,Nexus,Acceleration,Quality,Elaboration,Continuation' where language_id = 2
  #update exchart_labels set label_en = E'Core,Shared understanding,Attraction,Finishing,Reality,Elaboration,Remarkable,Preparation,Storyteller,Connection,Ultimate' where language_id = 3

  def label
    self.send("label_#{I18n.locale}")
  end

end
