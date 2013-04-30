class Article < ActiveRecord::Base
	has_many :section_titles, :dependent => :destroy
	has_many :article_titles, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :sources, :dependent => :destroy
	has_many :admin_messages, :dependent => :destroy

	attr_accessible :main_title

	validates_presence_of :main_title

end
