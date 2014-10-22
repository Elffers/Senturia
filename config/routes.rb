Emilarr::Application.routes.draw do

  get "admin/home"
  get "/operas/new"       => 'operas#new'
  post '/operas'          => 'operas#create', as: :operas
  get "/operas/:id/edit"  => 'operas#edit'
  patch '/operas/:id'     => 'operas#update', as: :opera
  delete 'operas/:id'     => 'operas#delete'

  get "/resume"           => "application#serve", as: :resume
  get "/analytics"        => "analytics#home"

  get "/admin"            => "admin#home"

  get "/edit_bio"         => "admin#edit_bio"
  post "/edit_bio"       => "admin#update_bio"

  get "/update_resume"    => "admin#edit_resume"
  patch "/update_resume"  => "admin#update_resume"

  resources :links

  # TODO: put this back in the future
  # get "/calendar" => "welcome#calendar"
  # get "/new_performance" => "admin#new_performance"
  # post "/new_performance" => "admin#create_performance"

  root 'welcome#home'


end
