Emilarr::Application.routes.draw do

  get "admin/home"
  get "/operas/new" => 'operas#new'
  post '/operas' => 'operas#create', as: :operas
  get "/operas/:id/edit" => 'operas#edit'
  patch '/operas/:id' => 'operas#update', as: :opera
  delete 'operas/:id' => 'operas#delete'

  get "public/resumes/resume.pdf" => "application#serve"
  get "/calendar" => "welcome#calendar"
  get "/analytics" => "analytics#home"

  get "/admin" => "admin#home"
  get "/new_performance" => "admin#new_performance"
  post "/new_performance" => "admin#create_performance"

  get "/edit_bio" => "admin#edit_bio"
  post "/edit_bio" => "admin#update_bio"

  # get "/update_rep" => "analytics#add_rep", as: :opera

  root 'welcome#home'


end
