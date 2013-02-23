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
		@article = Article.find(params[:article_id])
		@titles = @article.article_titles
		@title = @article.article_titles.new
	end

	def update
		@article = Article.find(params[:article_id])
		@title = @article.article_titles.create(params[:article_title])

		redirect_to request.referer
	end

	def destroy
		title = ArticleTitle.find(params[:article_title_id])
		title.destroy
		redirect_to request.referer
	end



end
