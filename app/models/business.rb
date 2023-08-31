class Business < ApplicationRecord
  has_many :reviews
  has_many :photos
  has_many :follows
  belongs_to :category, optional: true
    
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  # validates :website, presence: true
end
