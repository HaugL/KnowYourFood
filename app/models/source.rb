class Source < ActiveRecord::Base
	belongs_to :article

   attr_accessible :type_id, :source, :notes, :title, :link

   validates_presence_of :type_id, :source, :title
end
