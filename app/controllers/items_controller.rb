class ItemsController < ApplicationController
    
    before_action :authenticate_user, except: [:index]
    before_action :logged_in?, except: [:index]
    before_action :current_user, except: [:index]
    before_action :find_item, only: [:show, :edit, :update, :destroy]

    def index 
        @items = Item.all
    end

    def new 
        @item = Item.new 
    end
    
    def create 
        @item = current_user.items.build(item_params)
        #byebug
        if @item.save!
            #render :show
            redirect_to user_item_path(current_user, @item)
        else
            redirect_to new_item_path
        end
    end

    def show 
         raise params.inspect     
    end

    def edit      
    end

    def update
        if @item.update(item_params)
            redirect_to user_item_path(current_user, @item)
        else  
            render :edit
        end
    end

    def destroy 
        @item.destroy 
        redirect_to user_path(current_user)
    end

    private 

    def item_params
        params.require(:item).permit(:name, :new, :description, :price, :category_name)
    end

    def find_item
        @item = Item.find(params[:id])
    end

end
