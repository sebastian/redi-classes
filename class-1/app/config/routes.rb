Rails.application.routes.draw do
  resources :people do
    member do
      post "transfer/:other_id" => "people#transfer"
    end
  end
  root "people#index"
end
