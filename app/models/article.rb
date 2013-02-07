class Article < ActiveRecord::Base
	has_many :section_titles
	has_many :article_titles
end
