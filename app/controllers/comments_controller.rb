class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @article = Article.find(params[:article_id])
    @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author).merge(author: current_user.username)
  end
end
