class SubSection < ActiveRecord::Base
  belongs_to :section_title
  attr_accessible :sub_section_title_id, :text
end
