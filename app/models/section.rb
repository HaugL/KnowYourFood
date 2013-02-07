class Section < ActiveRecord::Base
   belongs_to :section_title
   
   attr_accessible :text, :section_title_id
end
