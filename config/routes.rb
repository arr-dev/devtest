Rails.application.routes.draw do
  namespace :api do
    namespace :public do
      get "locations/:country_code", to: "locations#show", as: "location"
      get "target_groups/:country_code", to: "target_groups#show", as: "target_group"
    end
  end
end

