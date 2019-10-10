class ItemsController < ApplicationController

    before_action :find_item, only: [:show, :edit, :update, :destroy]

    def index 
        @items = Item.all
    end

    def new 
        @item = Item.new 
    end
    
    def create 
        #byebug
        #raise params.inspect
        @item = Item.new(item_params)
        if @item.save
            redirect_to item_path(@item)
        else
            redirect_to new_item_path
        end
    end

    def show        
    end

    def edit       
    end

    def update
        if @item.update(item_params)
            redirect_to item_path(@item)
        else  
            render :edit
        end
    end

    def destroy 
    end

    private 

    def item_params
        params.require(:item).permit(:name, :new, :description, :price, :category_name)
    end

    def find_item
        @item = Item.find(params[:id])
    end

end
