class ArticleTitle < ActiveRecord::Base
  belongs_to :article
  attr_accessible :title, :article_id

  validates_presence_of :title
end
