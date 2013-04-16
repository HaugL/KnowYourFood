class Message < ActiveRecord::Base
	belongs_to :article
	belongs_to :message
	belongs_to :user
	belongs_to :admin 
	belongs_to :message_type

  	attr_accessible :subject, :message, :user_id, :message_id, :replied, :message_type_id
end
