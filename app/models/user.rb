
class User < ApplicationRecord
  has_secure_password 
  # validations: false

  def self.authenticated(name,password)
    where("lower(name) LIKE ?", name.to_s.downcase).first.try(:authenticate, password)
  end

end
