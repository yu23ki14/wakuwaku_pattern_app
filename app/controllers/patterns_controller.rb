class PatternsController < ApplicationController
  before_action :set_pattern, only: [:edit, :update, :destroy, :show, :unit]
  #before_action :set_favorites, only: [:show, :details, :fav]

  # GET /patterns
  # GET /patterns.json
  def index
    @categories = Category.includes(pattern_groups: [:patterns]).all.order(category_id: "asc")
  end

  def show
    @tiny_patterns = @pattern.tiny_patterns.order(id: "asc")
  end
  
  def list
    type = params[:type]
    if type.present? && type == "category" || type == "patterns"
      @type = type
    else
      @type = "category"
    end
  end
  
  def tiny
    @tiny_pattern = TinyPattern.find(params[:id])
    render :json => @tiny_pattern
  end
  
  def unit
    @patterns = Pattern.where(unit_no: params[:id]).order(:pattern_index)
    render :json => @patterns
  end
  
  def fav
    if user_signed_in?
      @favorite = @favorites.find_by(pattern_no: params[:pattern_no])
      if @favorite == nil
        @favorite = Favorite.create(user_id: current_user.id, language_id: params[:language_id], pattern_no: params[:pattern_no])
      else
        @favorite.destroy
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pattern
      @pattern = Pattern.find(params[:id])
    end
    
    def set_favorites
      if user_signed_in?
        @favorites = @user.favorites
      end
    end
end
