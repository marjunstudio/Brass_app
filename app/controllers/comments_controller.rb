class CommentsController < ApplicationController
  # 機能実装後、消すこと
  skip_before_action :require_login, only: %i[create]
  def create
    comment = current_user.comments.build(comment_params)

    if comment.save
      redirect_to search_result_path(params[:search_result_id]), notice: "コメントを投稿しました。"
    else
      redirect_to search_result_path(params[:search_result_id]), alert: "コメントの投稿に失敗しました。"
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
