class Category < ApplicationRecord
  has_many :business

  # validades :name, presence: true, uniqueness: true
end
