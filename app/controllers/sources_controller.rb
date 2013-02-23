class SourcesController < ApplicationController

################################################

	def new
		@article = Article.find(params[:article_id])
		@source = @article.sources.new
		@types = SourceType.all
		render 'edit'
	end

	def create
		@article = Article.find(params[:article_id])
		@source = @article.sources.new(params[:source])

		if @source.save
			redirect_to edit_article_path(@article)
		else
			render 'edit'
		end
	end

################################################

	def edit
		@article = Article.find(params[:article_id])
		@source = Source.find(params[:id])
		@types = SourceType.all
	end

	def update
		Source.find(params[:id]).update_attributes(params[:source])
		redirect_to article_path(params[:article_id])
	end

################################################

	def destroy
		Source.find(params[:id]).destroy
		redirect_to article_path(params[:article_path])
	end


end
