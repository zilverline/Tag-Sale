class CategoriesController < ApplicationController

    def index 
        @categories = Category.all
    end

    def new 
    end

    def create
        @category = Category.create(category_params)
    end

    def show 
        @category = Category.find(params[:id])
    end

    def edit 

    end

    def update 

    end

    def destroy 

    end

    private 

    def category_params 
        params.require(:category).permit(:name)
    end
end
