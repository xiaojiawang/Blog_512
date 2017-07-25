
class User < ApplicationRecord
  has_secure_password validations: false
  before_create :init_data

  def self.authenticated(name,password)
    where("lower(name) LIKE ?", name.to_s.downcase).first.try(:authenticate, password)
  end

  def init_data
    self.password = 'mUc3m09RsgyRf' if self.password_digest.blank?
  end

end
