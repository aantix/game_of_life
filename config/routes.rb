Rails.application.routes.draw do
  resources :games do
    resources :generations do
    end
  end

  root to: 'games#new'
end
