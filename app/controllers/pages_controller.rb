class PagesController < ApplicationController

    def search  
        if params[:search].blank? 
            
            redirect_to items_path  
        else  
            #@parameter = params[:search].downcase  
            #@results = Item.joins(:category).search(params[:search]).sort("categories.name DESC")
            @items = Item.where("name LIKE ?", "%" + params[:search] + "%")
            #@items = Item.where("description LIKE ?", "%" + params[:search] + "%")
            
            render 'search'
        end  
    end
end