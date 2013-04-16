class ArticlesController < ApplicationController
	 before_filter :check_admin, :only => [:new, :create, :edit, :update]
	 helper_method :get_names

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
		@article = Article.create
		titles = params[:titles][:list].split(',')

		titles.each do |title|
			@article.article_titles.create(:title => title)
		end

		redirect_to edit_article_path(@article.id)
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
		@articles_hash = create_hash(@articles)
	end

	def show
		@article = Article.find(params[:id])
		@title = stringify_titles(@article.article_titles)
		@section_titles = @article.section_titles
		@first_section = @section_titles.first
		@sub_section_titles = @first_section.sub_section_titles

		@sources = @article.sources.limit(3)

		@comment = @article.comments.new
		@comments = @article.comments.limit(3)

		@message = @article.messages.new
		@message_types = MessageType.all
		
	end


###########################################

	def destroy
		Article.find(params[:id]).destroy
		redirect_to articles_path
	end

###########################################

def search
	@titles = ArticleTitle.find(:all, :conditions => ["title LIKE ?", "#{params[:q]}%"])
	@articles = find_articles_from_titles(@titles)
	@articles_hash = create_hash(@articles)
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

	def create_hash(articles)
		hash = {}
		articles.each_with_index do |article, i|
			hash[i] = {:id => article.id, :titles => stringify_titles(article.article_titles)}
		end

		return hash
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
