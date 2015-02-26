class User < ActiveRecord::Base
	has_many :insults
	has_many :comebacks
end
