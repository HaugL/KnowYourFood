class Message < ActiveRecord::Base
	belongs_to :message
	belongs_to :user
	belongs_to :admin 
	has_many :messages

  	attr_accessible :subject, :message, :user_id, :message_id, :replied
end
