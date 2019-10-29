class PagesController < ApplicationController

    def search  
        if params[:search].blank? 
            
            redirect_to items_path  
        else  
            singular = params[:search].singularize.downcase
            @items = Item.where("name LIKE ? OR description LIKE ?", "%" + singular + "%", "%" + singular + "%")
            render :search
        end  
    end
end