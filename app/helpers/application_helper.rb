module ApplicationHelper
    def is_active(action)       
        params[:controller] == action ? "text-green-700 border-b-4" : "blaaaa"        
    end
end
