class ArticlesController < ApplicationController

	def new
		@article = Article.create
	end

	def create
		@article = Article.create
		titles = params[:titles][:list].split(',')

		titles.each do |title|
			@article.article_titles.create(:title => title)
		end

		redirect_to edit_article_path(@article.id)
	end

	def edit
		@article = Article.find(params[:id])
		@titles = @article.article_titles
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
