class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(params[:comment])
    session[:user] ? @comment.user_id = session[:user] : @comment.user_id = session[:admin]
    
    if @comment.save
      redirect_to article_path(@article)
    else

      render 'new'
    end

  end


  def show

  end


  def destroy
  	Comment.find(params[:id]).destroy
  	redirect_to article_path(params[:article_id])
  end

end
