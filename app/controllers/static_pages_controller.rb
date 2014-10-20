class StaticPagesController < ApplicationController
  def location
    @lat = params[:lat]
    @lon = params[:lon]
    @accu = params[:accuracy]
  end

  def help
  end

  def about
  end

  def contact
  end
end
