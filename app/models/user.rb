class User < ApplicationRecord

    has_secure_password

    validates :name, :email, presence: true 
    validates :name, :email, uniqueness: true 
    
    has_many :items 
    has_many :categories, through: :items

end
