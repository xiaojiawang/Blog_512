class Article < ApplicationRecord
  validates :author, presence: true
end
