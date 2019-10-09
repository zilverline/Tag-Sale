class ItemsController < ApplicationController

    before_action :find_item, only: [:show, :edit, :update, :destroy]

    def index 
        @items = Item.all
    end

    def new 
        @item = Item.new 
    end
    
    def create 
        @item = Item.new(item_params)
    end

    def show 
        
    end

    def edit
    end

    def update 
    end

    def destroy 
    end

    private 

    def item_params
        params.require(:item).permit(:name, :new, :description)
    end

    def find_item
        @item = Item.find(params[:id])
    end

end
