class CommentsController < ApplicationController
  before_action :signed_in_user

  def create
    comment = current_user.comments.create(station_id: params[:station],
                                               nickname: current_user.nickname,
                                               content: comment_params[:content])
    if comment.id
      flash[:success] = "コメントを投稿しました"
      redirect_to station_path(id:METRO_STATION.keys[params[:station].to_i-1])
    else
      flash[:warning] = "コメントを投稿できませんでした"
      redirect_to station_path(id:METRO_STATION.keys[params[:station].to_i-1])
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def signed_in_user
      redirect_to root_path, notice: "ログインしてください" unless signed_in?
    end

end
