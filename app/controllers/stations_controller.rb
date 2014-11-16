class StationsController < ApplicationController
  def index
  end

  def show
    @station = Station.find_by_id(METRO_STATION.keys.find_index(params[:id])+1)
    @comments = @station.comments.paginate(page: params[:page])
    @comment = current_user.comments.build if signed_in?
  end
end
