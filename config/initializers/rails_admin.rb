RailsAdmin.config do |config|

  config.authorize_with do
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == Rails.application.secrets.admin_username && password == Rails.application.secrets.admin_password
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
