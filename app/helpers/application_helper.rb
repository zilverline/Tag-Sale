module ApplicationHelper
    
    def sortable(column, title = nil)
        title ||= column.titleize
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title, :sort => column, :direction => direction
    end

    def item_condition(item)
        if item.new 
            "New"
        else 
            "Used"
        end 
    end

    def image_present?(item)
        if item.image.attached?
            return image_tag(item.image, style:'width:30%')
        end
    end

    def logo
        return image_tag("tagsalelogo1.png", height:"50")
    end

    def render_navbar
        if logged_in?
            render 'layouts/logged_in_navbar'
        else
            render 'layouts/logged_out_navbar'
        end
    end

    def render_item
        if current_user == @item.user
            render 'items/current_user'
        else
            render 'items/not_current_user'
        end
    end

end
