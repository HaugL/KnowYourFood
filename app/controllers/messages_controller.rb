class MessagesController < ApplicationController


	def create
		@article = Article.find(params[:article_id])
		

		@message = @article.messages.new()
		@message.message_type_id = 4
		@message.subject = params[:message][:subject]
		@message.message = params[:message][:message]
		if @message.save
			redirect_to home_path
		else
			redirect_to article_path(@article)
		end
	end
end
