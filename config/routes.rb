Rails.application.routes.draw do
  get '/google-maps', to: 'google_maps#http_party'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
