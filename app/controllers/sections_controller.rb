class SectionsController < ApplicationController
	def new
		@article = Article.find(params[:article_id])
		@section = Section.new
		render 'edit'
	end

	def edit
		
	end

	def create
		@article = Article.find(params[:article_id])
		title = @article.section_titles.create(:title => params[:model][:title])
		section = title.sections.create(:text => params[:model][:text])

		redirect_to edit_article_path(@article)
	end



end
