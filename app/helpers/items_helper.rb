module ItemsHelper

    def render_item
        if current_user == @item.user
            render 'current_user'
        else
            render 'not_current_user'
        end
    end

end
