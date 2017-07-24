class User < ApplicationRecord
	def self.authenticated(name,password)
		where("lower(name) LIKE ?", name.to_s.downcase).first.try(:password)==password
	end
end
