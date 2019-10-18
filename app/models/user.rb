class User < ApplicationRecord

    has_secure_password

    validates :name, :email, presence: true 
    validates :name, :email, uniqueness: true
    #validates :name, length: { minimum: 2 }
    validates :password, length: { in: 4..40 }
    
    has_many :items 
    has_many :categories, through: :items


    def self.find_or_create_by_omniauth(auth_hash)        
        user = self.where(:email => auth_hash[:info][:email]).first_or_create do |user|
            user.name = auth_hash[:info][:name]
            user.password = SecureRandom.hex 
        end
    end
end
