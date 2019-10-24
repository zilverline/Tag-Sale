class Item < ApplicationRecord

    has_one_attached :image

    belongs_to :user 
    belongs_to :category 

    validates :name, :price, :description, :category_name, presence: true
    validates :name, length: { minimum: 2 }
    validates :description, length: { maximum: 300 }
    
    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
    end

    def category_name 
        self.category ? self.category.name : nil
    end

    def self.search(search)  
        where("lower(items.description) LIKE :search OR lower(items.name) LIKE :search", search: "%#{search.downcase}%, %#{search.downcase}%").uniq   
    end
end
