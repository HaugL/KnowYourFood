class SectionTitle < ActiveRecord::Base
  belongs_to :article
  has_many :sub_section_titles, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  
  attr_accessible :title, :article_id

    validates_presence_of :title
end
