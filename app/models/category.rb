class Category < ApplicationRecord

    has_many :items 
    has_many :users, through: :items 

    validates :name, presence: true
    validates :name, uniqueness: true 

end
