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
		
	end

	def update
		
	end

####################################

	def destroy
		
	end

	
end
