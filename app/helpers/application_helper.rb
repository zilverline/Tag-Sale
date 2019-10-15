module ApplicationHelper

    def alert_class(flash_type)       
        case flash_type.to_s
        when :notice
            "alert success"
        when :alert
            "alert-warning"
        when :error
            "alert-danger"
        end       
    end

    def sortable(column, title = nil)
        title ||= column.titleize
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title, :sort => column, :direction => direction
    end

end
