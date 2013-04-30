class ArticlesController < ApplicationController
	 before_filter :check_admin, :only => [:new, :create, :edit, :update]
	 helper_method :get_names
	 helper_method :stringify_titles

###########################################

	def check_admin

	 	unless session[:admin]
	 		redirect_to root_path()
	 	end
	end


###########################################

	def new
		@article = Article.new
	end

	def create
		@article = Article.create(params[:article])
		redirect_to new_article_title_path(@article)
	end


###########################################

	def edit
		@article = Article.find(params[:id])
		@titles = @article.article_titles
		@section_titles = @article.section_titles
	end


###########################################

	def index
		@articles = Article.order("updated_at DESC").limit(5)
	end

	def show
		@article = Article.find(params[:id])

		@section_titles = @article.section_titles
		@first_section = @section_titles.first
		@sub_section_titles = @first_section.sub_section_titles

		@sources = @article.sources.limit(3)

		@comment = @article.comments.new
		@comments = @article.comments.limit(3)

		@message = @article.admin_messages.new
		@message_types = MessageType.all
		
	end


###########################################

	def destroy
		Article.find(params[:id]).destroy
		redirect_to articles_path
	end

###########################################

def search
	titles = ArticleTitle.find(:all, :conditions => ["title LIKE ?", "#{params[:q]}%"])
	@articles = find_articles_from_titles(titles)
	render 'index'
end

###########################################

	private

	def get_names article
		names_a = article.article_titles
		name = ''

		names_a.each do |n|
			name = name + ', '+n.title 
		end

		name.chop.chop!
		return name[2..name.length]
	end

	def stringify_titles(article_titles)
		title = " "
		article_titles.each do |t|
			title = title+', '+t.title
		end
		return title[3..title.length]
	end


	def find_articles_from_titles(titles)
		articles = []
		titles.each do |title|
			article  = title.article
			if (articles & [article]).empty?
				articles << article
			end
		end

		return articles
		
	end









end
