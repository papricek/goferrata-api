Rails.application.config.middleware.insert_before 0, "Rack::Cors" do
  allow do
    origins 'goferrata.dev:4200', 'goferrata.com'
    resource '*', :headers => :any, :methods => [:get, :post, :options]
  end
end
