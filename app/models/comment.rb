class Comment < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
	
  	attr_accessible :user_id, :article_id, :text, :rank

  	validates :text, :presence => true

end
