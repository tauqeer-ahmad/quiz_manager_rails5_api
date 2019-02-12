Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :questions, only: %i[index show create update destroy] do
        resources :answers, only: %i[index show create update destroy]
      end
    end
  end
end
