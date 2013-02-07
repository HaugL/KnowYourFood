class ArticlesController < ApplicationController

	def new
		@article = Article.create
		redirect_to new_article_title_path(@article)
	end

	def create
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@titles =  @article.titles
		@sections = @article.sections.all
	end



end
