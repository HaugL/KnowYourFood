class AdminMessagesController < ApplicationController

#####################################################
	
	def new
		@article = Article.find(params[:article_id])
		@message = @article.admin_messages.new
	end
	
	def create
		@article = Article.find(params[:article_id])
		
		@message = @article.admin_messages.new(params[:admin_message])
		@message.user_id = session[:user]
		if @message.save
			render 'success'
		else
			@message.errors.full_messages.each do |error|
				puts error
			end
			render 'new'
		end
	end


	def success
		
	end

#####################################################

	def index
		@messages = AdminMessage.where(:replied => false)
	end

	def edit
		@message = AdminMessage.find(params[:id])
	end

	def update
		message = AdminMessage.find(params[:reply][:message_id])
		message.replied = true
		message.admin_id = session[:admin].id
		message.save

		UserMailer.reply_message(params[:reply][:text], message.user.email).deliver
		@message = AdminMessage.find(params[:id])

		@messages = AdminMessage.where(:replied => false)
		render 'index'
	end

	def destroy
		AdminMessage.find(params[:id]).destroy
		@messages = AdminMessage.where(:replied => false)
		render 'index'
	end

end
