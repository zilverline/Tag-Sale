class User < ApplicationRecord

    has_secure_password

    validates :name, :email, presence: true 
    validates :name, :email, uniqueness: true
    validates :name, length: { minimum: 2 }
    validates :password, length: { in: 4..20 }
    
    has_many :items 
    has_many :categories, through: :items

end
