class Project < ActiveRecord::Base
	has_many :tasks
	validates :title, 
		presence: {message: "please input anything"},
		length: {minimum: 3, message: "too short sentence"}
end
