class CommentsController < ApplicationController
  def show
  end

  def create
  	@article = Article.find(params[:article_id])
  	comment = @article.comments.new(params[:comment])
  	session[:user] ? comment.user_id = session[:user].id : comment.user_id = session[:admin].id
  	comment.save

  	redirect_to article_path(@article)
  end

  def destroy
  	Comment.find(params[:id]).destroy
  	redirect_to article_path(params[:article_id])
  end

end
