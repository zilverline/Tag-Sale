class Item < ApplicationRecord

    has_one_attached :image

    belongs_to :user 
    belongs_to :category 

    validates :name, :price, :description, presence: true
    #validates :category_name, uniqueness: true 
    
    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
    end

    def category_name 
        self.category ? self.category.name : nil
    end
end
