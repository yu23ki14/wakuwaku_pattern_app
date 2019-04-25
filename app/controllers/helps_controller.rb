class HelpsController < ApplicationController
  
  def index
    @helps = Help.all
  end
  
  def show
    @help = Help.find(params[:id])
  end
end
