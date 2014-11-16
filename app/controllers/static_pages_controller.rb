class StaticPagesController < ApplicationController
  def location
    @lat = params[:lat]
    @lon = params[:lon]
    @accu = params[:accuracy]
  end

  def unvisited
    @confirm = params[:confirm]
    @station = params[:station]
  end

  def uncommented
    @confirm = params[:confirm]
    @comment = params[:id]
  end

  def help
  end

  def about
  end

  def contact
  end
end
