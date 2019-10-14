class ItemsController < ApplicationController
    
    before_action :authenticate_user, except: [:index, :show]
    before_action :logged_in?, except: [:index, :show]
    before_action :current_user, except: [:index, :show]
    before_action :find_item, only: [:show, :edit, :update, :destroy]

    def index 
        @items = Item.all
    end

    def new 
        @item = Item.new 
    end
    
    def create 
        @item = current_user.items.build(item_params)
        if @item.save
            redirect_to user_item_path(current_user, @item), notice: "Item Created!"
        else
            @errors = @item.errors.full_messages
            redirect_to new_item_path
        end
    end

    def show      
    end

    def edit      
    end

    def update
        if @item.update(item_params)
            redirect_to user_item_path(current_user, @item), notice: "Item Updated!"
        else  
            @errors = @item.errors.full_messages
            render :edit
        end
    end

    def destroy 
        @item.destroy 
        redirect_to user_path(current_user), notice: "Deleted Item: #{@item.name}"
    end

    private 

    def item_params
        params.require(:item).permit(:name, :new, :description, :image, :price, :category_name)
    end

    def find_item
        @item = Item.find(params[:id])
    end

end