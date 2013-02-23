class SubSectionsController < ApplicationController
####################################

	def new
	end

	def create
		section = Section.find(params[:section_id])
		section_title = section.section_title

		sub_section_title = section_title.sub_section_titles.create(:title => params[:model][:title])
		sub_section = sub_section_title.sub_sections.create(:text => params[:model][:text])

		redirect_to edit_article_path(params[:article_id])
	end

####################################

	def edit
		@sub_section = SubSection.find(params[:id])
		@sub_title = @sub_section.sub_section_title
	end

	def update
		sub_section = SubSection.find(params[:id])
		sub_title = sub_section.sub_section_title

		sub_title.update_attributes(:title => params[:model][:title])
		sub_section.update_attributes(:text => params[:model][:text])

		redirect_to edit_article_path(params[:article_id])

	end

####################################

	def destroy
		sub = SubSection.find(params[:id])
		title = sub.sub_section_title
		title.destroy
		sub.destroy

		redirect_to article_path(params[:article_id])
	end

	
end
