class Article < ActiveRecord::Base
	has_many :section_titles, :dependent => :destroy
	has_many :article_titles, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :sources, :dependent => :destroy
	has_many :messages, :dependent => :destroy

end
