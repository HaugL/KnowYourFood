class AjaxController < ApplicationController

	def get_section

		#This hash will hold the section text and all of the sub sections
		@hash = {}
		#This hash will hold all of the sub_section titles and text
		sub_section_hash = {}


		#Get the section_title id from the params
		section_title= params[:section_title].split('/').last.to_i
		section_text = Section.find_by_section_title_id(section_title)
		@hash[:text] = section_text.text


		sub_section_titles = SubSectionTitle.where( :section_title_id => section_title)
		sub_section_titles.each do |sub_section|
			sub_section_hash[sub_section.title.to_sym] = SubSection.find_by_sub_section_title_id(sub_section)
		end

		@hash[:sub_sections] = sub_section_hash


		respond_to do |format|
		    format.json { render :json => @hash}
	  	end
	end



end
