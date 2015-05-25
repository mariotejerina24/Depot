class Product < ActiveRecord::Base
	belongs_to :editorial
	has_and_belongs_to_many :categories


end
