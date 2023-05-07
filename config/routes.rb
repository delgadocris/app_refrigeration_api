Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # devise_for :users

  # namespace :api, defaults: {format: :json} do
  #   namespace :v1 do
  #     devise_scope :user do
  #       post "sign_up", to: "registrations#create"
  #       post "sign_in", to: "sessions#create"
  #       post "log_out", to: "sessions#destroy"
  #     end
  #   end
  # end
end
