class AdminMessage < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
	belongs_to :admin 
	belongs_to :message_type

  	attr_accessible :subject, :text, :user_id, :message_id, :replied, :message_type_id

  	validates :text, :presence => true
  	validates :user_id, :presence => true
  	validates :message_type_id, :presence => true


end
