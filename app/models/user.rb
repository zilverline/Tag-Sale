class User < ApplicationRecord

    has_secure_password

    validates :name, uniqueness: true 
    validates :name, presence: true 
    
    has_many :items 
    has_many :categories, through: :items

end
