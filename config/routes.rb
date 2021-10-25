Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists do
     resources :items
  end

  resources :items 

  get "view_by_date/:date/items" => "items#view_by_date"

end
