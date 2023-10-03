class User < ApplicationRecord
    has_many :reviews
    has_many :photos
    has_many :follows
    has_many :likes

    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    def generate_authentication_token
        token = Devise.friendly_token
        self.update(authentication_token: token)
        token
      end
end

    # validates :username, presence: true
    # validates :email, presence: true, uniqueness: true
    # validates :password, presence: true, uniqueness: true

    # attribute :favorite_foods, :text, array: true, default: []
    # attribute :recently_visited_places, :text, array: true, default: []

    # def add_favorite_food(food)
    #     self.favorite_foods << food
    #     save
    #   end
    
    #   def add_recently_visited_place(place)
    #     self.recently_visited_places << place
    #     save
    #   end
