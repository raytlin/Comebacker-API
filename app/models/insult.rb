class Insult < ActiveRecord::Base
	has_many :comebacks
	belongs_to :user
end
