Rails.application.routes.draw do

  mount RailsAdmin::Engine => "/", constraints: { subdomain: "admin" }

  constraints subdomain: "api" do
    resources :points
  end

end
