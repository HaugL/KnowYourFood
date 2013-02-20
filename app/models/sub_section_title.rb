class SubSectionTitle < ActiveRecord::Base
	belongs_to :section_title
	has_many :sub_sections, :dependent => :destroy

  	attr_accessible :title, :section_title_id

  	validates_presence_of :title
end
