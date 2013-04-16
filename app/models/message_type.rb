class MessageType < ActiveRecord::Base
  has_many :messages
  attr_accessible :name
end
