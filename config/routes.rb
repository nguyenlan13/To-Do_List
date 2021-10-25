Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists do
     resources :items
     get "view_by_date/:date/items" => "items#view_by_date", as: :view_by_date
  end

  resources :items 

  # get "view_by_date/:date/items" => "items#view_by_date", as: :view_by_date

  root 'lists#new'
end
