class SectionsController < ApplicationController
	def new
		@article = Article.find(params[:article_id])
		@section = @article.sections.new
		render 'edit'
	end

	def edit
		
	end

	def create
		@article = Article.find(params[:article_id])
		section = @article.sections.create(params[:section])
		@section = @article.sections.new
		render 'edit'	
	end



end
