Emilarr::Application.routes.draw do
  
  get "operas/new" => 'operas#new'
  get "operas/edit"
  root 'welcome#home'

  get "public/resume.pdf" => "application#serve"
  get "/calendar" => "welcome#calendar"
  get "/analytics" => "analytics#home"
  get "/new_performance" => "analytics#new_performance"
  post "/new_performance" => "analytics#create_performance"

  get "/edit_bio" => "analytics#edit_bio"
  post "/edit_bio" => "analytics#update_bio"

  get "/update_rep" => "analytics#add_rep", as: :opera
  post "/update_rep" => "analytics#update_rep"
  get "/edit_rep/:id" => "analytics#edit_rep"
  patch "/update_rep" => "analytics#update_rep"

end
