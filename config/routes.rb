Rails.application.routes.draw do

  constraints subdomain: "admin" do
    mount RailsAdmin::Engine => "/"
  end

  constraints subdomain: "api" do
    resources :points do
      resources :comments
    end
    resources :users do
      post :login, on: :collection
    end
  end

end
