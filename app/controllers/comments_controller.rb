class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(content_params)
    @comment.topic_id = params[:topic_id]

    if @comment.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  private
  def content_params
    params.require(:comment).permit(:content)
  end 
end
