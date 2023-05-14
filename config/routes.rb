Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      # devise_scope :user do
      #   post "sign_up", to: "registrations#create"
      #   post "sign_in", to: "sessions#create"
      #   post "log_out", to: "sessions#destroy"
      # end

      resources :branches, only: [:index, :create] do
        collection do
          get '/fridge/:fridge', action: 'by_fridge'
          patch '/fridge/:fridge', action: 'update_by_fridge'
        end
      end
    end
  end

  get '*path' => redirect('/')
end
