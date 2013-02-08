class ArticleTitlesController < ApplicationController

	def new
		@article = Article.find(params[:article_id])
		@title = @article.titles.new
		@titles = @article.titles.all
		
		render 'edit'
	end

	def create
		@article = Article.find(params[:article_id])
		title = @article.titles.create(params[:title])
		@title = @article.titles.new
		@titles = @article.titles.all

		render 'edit'		
	end

	def edit
	end

	def update
	end

	def delete
		title = Title.find(params[:title_id])
		title.destroy
		redirect_to new_article_title_path(params[:article_id])
	end



end
