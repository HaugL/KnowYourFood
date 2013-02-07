class ArticleTitle < ActiveRecord::Base
  belongs_to :article
  attr_accessible :title, :article_id
end
