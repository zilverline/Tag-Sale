#MyApp/app/config/routes.rb
get '/search' => 'pages#search', :as => 'search_page'


#Path     
MyApp/app/view/pages/

#File 
search.html.erb
<h3>Search Result</h3>  
    <% @results.each do |result| %>  
        <%= result.store.name %> <%= result.name %><br>  
    <% end %>


#for layout application.html.erb
<%= form_tag(search_page_path, :method => "get",   
    class: 'navbar-form navbar-left') do %>  
  <div class="input-group">  
    <%= search_field_tag :search, params[:search], placeholder: "Search", class: "form-control" %>  
    <div class="input-group-btn">  
      <%= button_tag "", :class => 'btn btn-info glyphicon glyphicon-search',:name => nil%>  
    </div>  
  </div>  
<% end %>


#MyApp/app/controllers/pages_controller.rb
def search  
  if params[:search].blank?  
    redirect_to(root_path, alert: "Empty field!") and return  
  else  
    #@parameter = params[:search].downcase  
    #@results = Store.all.where("lower(name) LIKE :search", search: @parameter)
    @results = Item.joins(:category).search(params[:search]).order("categories.name DESC")  
  end  
end


#MyApp/app/models/item.rb

def self.search(search)  
   where("lower(categories.name) LIKE :search OR lower(items.name) LIKE :search", search: "%#{search.downcase}%").uniq   
end