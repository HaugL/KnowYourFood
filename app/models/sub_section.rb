class SubSection < ActiveRecord::Base
  belongs_to :sub_section_title
  attr_accessible :sub_section_title_id, :text

    validates_presence_of :text
end
