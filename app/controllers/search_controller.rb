class SearchController < ApplicationController
	def search
		@article_titles = ArticleTitle.where(["title LIKE :search", {:search => params[:q]}]) 
	end
end
