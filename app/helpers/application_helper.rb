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

end
