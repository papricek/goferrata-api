Rails.application.routes.draw do

  constraints subdomain: "admin" do
    mount RailsAdmin::Engine => "/"
  end

  constraints subdomain: "api" do
    resources :points
  end

end
