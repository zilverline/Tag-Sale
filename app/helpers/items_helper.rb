module ItemsHelper

    def render_item
        if current_user == @item.user
            render 'current_user'
        else
            render 'not_current_user'
        end
    end

    def sort_buttons? 
        if !@search
            render "items/sort"
        end
    end

    def search_back_button
        if @search 
            render "items/back_button"
        end
    end

    def title_helper
        if @search 
            "Search Results"
        else
            "Shop all Items"
        end
    end

end
