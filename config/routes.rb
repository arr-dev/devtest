Rails.application.routes.draw do
  namespace :api do
    namespace :public do
      get "locations/:country_code", to: "locations#show", as: "location"
      get "target_groups/:country_code", to: "target_groups#show", as: "target_group"
    end
    namespace :private do
      get "locations/:country_code", to: "locations#show", as: "location"
      get "target_groups/:country_code", to: "target_groups#show", as: "target_group"
      post "evaluate_target", to: "evaluate_targets#create", as: "evaluate_target"
    end
  end
end

