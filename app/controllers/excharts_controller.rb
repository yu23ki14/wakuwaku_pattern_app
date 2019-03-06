class ExchartsController < ApplicationController
  
  include Recommend
  
  def index
    @results = @user.excharts.order(created_at: "DESC")
    @results.each_with_index do |e, i|
      eval("gon.data#{i} = e.data")
    end
  end
  
  def show
    @exchart = Exchart.find(params[:id])
    gon.data = @exchart.data
    @patterns = Pattern.all.order(:pattern_index)
    gon.patterns = @patterns
    
    base_pattern_index = []
    @patterns.length.times do |index|
      base_pattern_index.push(index.to_s)
    end
    primary_pattern_index = JSON.parse(gon.data).select{|key,value| value > 0 }.keys()
    secondary_pattern_index = base_pattern_index - primary_pattern_index
    @primary_patterns = @patterns.where(pattern_index: primary_pattern_index)
    @secondary_patterns = @patterns.where(pattern_index: secondary_pattern_index)
    
    gon.recommended_patterns_id = three_recommended_patterns(gon.data)
    @recommended_patterns = Pattern.where(id: gon.recommended_patterns_id)
  end
  
  def pdf
    respond_to do |format|
      format.pdf do
        set_chart
        render pdf: 'dialogue_workshop_sheet',
               encording: 'UTF-8',
               layout: 'application_pdf.html',
               orientation: 'Landscape',
               show_as_html: params[:debug].present?
      end
    end
  end
  
  def send_pdf
    respond_to do |format|
      format.pdf do
        set_chart
        pdf = render_to_string pdf: "dialogue_workshop_sheet.pdf",
              encoding: "UTF-8",
              orientation: 'Landscape',
              layout: "application_pdf.html",
              template: "excharts/pdf.pdf.slim"
        ExchartMailer.send_pdf(current_user, pdf).deliver
        redirect_to excharts_path, notice: 'メールでPDFを送りました。'
      end
    end
  end
  
  def new
    @exchart = Exchart.new
    @patterns = Pattern.all
  end
  
  def create
    @exchart = Exchart.new(exchart_params)
    patterns_no = Pattern.all.length
    if exchart_params[:data1] != "" && JSON.parse(exchart_params[:data]).length == patterns_no
      if @exchart.save
        redirect_to @exchart
      else
        redirect_to new_exchart_path, alert: "保存に失敗しました。"
      end
    else
      redirect_to new_exchart_path, alert: "データに誤りがあります。"
    end
  end
  
  def event
  end
  
  def patterndetail
    @language = Language.find(params[:language_id])
    @pattern = @language.patterns.find_by(pattern_no: params[:pattern_no])
  end
  
  def compare
    @results = @user.excharts.order(created_at: "DESC")
    @results.each_with_index do |e, i|
      eval("gon.data#{i} = e.data")
    end
  end
  
  def compare_result
    if !params[:chart_id_1]
      redirect_to practices_path
    else
      @exchart_1 = Exchart.find(params[:chart_id_1])
      @exchart_2 = Exchart.find(params[:chart_id_2])
      
      if @exchart_1.created_at > @exchart_2.created_at
        temp = @exchart_1
        @exchart_1 = @exchart_2
        @exchart_2 = temp
      end
      
      data1 = @exchart_1.data
      gon.data = data1
      data2 = @exchart_2.data
      gon.data2 = data2
      @patterns = Pattern.order(:pattern_index)
      
      prev_pattern_index = JSON.parse(data1).select{|key,value| value > 0 }.keys()
      new_pattern_index = JSON.parse(data2).select{|key,value| value > 0 }.keys()
      all_pattern_index = prev_pattern_index + new_pattern_index
      new_pattern_index = all_pattern_index - prev_pattern_index
      @primary_patterns = @patterns.where(pattern_index: new_pattern_index)
      @secondary_patterns = @patterns.where(pattern_index: all_pattern_index)
    end
  end
  
  private
    def exchart_params
      params.require(:exchart).permit(:user_id, :data)
    end
    
    def set_chart
      @chart = params[:chart][:image]
      @exchart = Exchart.find(params[:id])
      data1 = @exchart.data1
      data2 = @exchart.data2
      @language = @exchart.language
      #@core_pattern = Pattern.where(language_id: @exchart.language_id).find_by(pattern_no: 0)
      #@patterns = Pattern.where(language_id: @exchart.language_id).where.not(pattern_no: 0).order(:pattern_no)
      @patterns = Pattern.where(language_id: @exchart.language_id).order(:pattern_no)
      @current_pattern_no = JSON.parse(data1).select{|key,value| value > 0 }.keys()
      @proximal_pattern_no = JSON.parse(data2).select{|key,value| value > 0 }.keys() - @current_pattern_no
    end
end
