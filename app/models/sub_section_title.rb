class SubSectionTitle < ActiveRecord::Base
	belongs_to :section_title
	has_one :sub_section

  	attr_accessible :title, :section_title_id
end
