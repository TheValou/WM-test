Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'phases/get_notifications'
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
