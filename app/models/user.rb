class User < ApplicationRecord

    has_secure_password

    validates :name, :email, presence: true 
    validates :name, :email, uniqueness: true
    validates :name, length: { minimum: 2 }
    validates :password, length: { in: 4..20 }
    
    has_many :items 
    has_many :categories, through: :items

    # def self.find_or_create_by_omniauth(auth_hash)

    #     oauth_email = auth_hash['omniauth.auth'][:info]['email']
    #         if user = User.find_by(:email => oauth_email)
    #             return user
    #         else
    #             user = User.create(:email => oauth_email, :password => SecureRandon.hex)
    #         end
    # end

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash[:info][:email]).first_or_create do |user|
        user.password = SecureRandom.hex 
        end
    end
end
