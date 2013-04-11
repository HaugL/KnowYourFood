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
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@section_titles = @article.section_titles
		@first_section = @section_titles.first
		@sub_section_titles = @first_section.sub_section_titles
		@comment = @article.comments.new
		@comments = @article.comments.limit(3)
		@sources = @article.sources.limit(3)
	end


###########################################

	def destroy
		Article.find(params[:id]).destroy
		redirect_to articles_path
	end

###########################################

	public

	def get_names article
		names_a = article.article_titles
		name = ''

		names_a.each do |n|
			name = name + ', '+n.title 
		end

		name.chop.chop!
		return name[2..name.length]
	end




end
