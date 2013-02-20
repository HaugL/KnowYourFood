class SectionsController < ApplicationController

###############################################
	def new
	end

	def create
		@article = Article.find(params[:article_id])
		title = @article.section_titles.create(:title => params[:model][:title])
		section = title.sections.create(:text => params[:model][:text])

		redirect_to edit_article_path(@article)
	end

###############################################

	def edit
		@section = Section.find(params[:id])
		@section_title = @section.section_title
	end

	def update
		@section = Section.find(params[:id])
		@section_title = @section.section_title

		@section.text = params[:model][:text]
		@section_title.title = params[:model][:title]

		if @section.save && @section_title.save
			redirect_to edit_article_path(params[:article_id])
		else
			render 'edit'
		end
		
	end

###############################################

	def destroy
		section = Section.find(params[:id])
		section_title = section.section_title

		section.destroy
		section_title.destroy

		redirect_to edit_article_path(params[:article_id])
	end

end
