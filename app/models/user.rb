class User < ApplicationRecord

    has_secure_password

    validates :name, :email, presence: true 
    validates :name, :email, uniqueness: true
    validates :name, length: { minimum: 2 }
    validates :password, length: { in: 4..40 }
    
    has_many :items 
    has_many :categories, through: :items

        #takes in auth_hash method from sessions controller
    def self.find_or_create_by_omniauth(auth_hash) 
        #sets user to User where it sets key of email to nested email value retrieved in auth hash to value of email.
        user = self.where(:email => auth_hash[:info][:email]).first_or_create do |user|
        #sets user key name to nested name value retrieved in auth hash to value of name.
            user.name = auth_hash[:info][:name]
        #sets user password to randomly generated string using securerandom.hex method.
            user.password = SecureRandom.hex 
        end
    end
end
