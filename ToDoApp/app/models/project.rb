class Project < ActiveRecord::Base
	validates :title, 
		presence: {message: "please input anything"},
		length: {minimum: 3, message: "too short sentence"}
end
