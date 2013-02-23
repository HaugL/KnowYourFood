class Message < ActiveRecord::Base
	belongs_to :message, :user, :admin 
	has_many :messages

  	attr_accessible :subject, :message, :user_id, :message_id, :replied
end
