class SectionTitle < ActiveRecord::Base
  belongs_to :article
  has_many :sub_section_titles
  has_many :sections
  
  attr_accessible :title, :article_id
end
