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

end
