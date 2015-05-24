class UsersController < ApplicationController

  def login
    @user = User.create_from_authorization_code(params[:authorization_code])
    status = @user.errors.present? ? 400 : 200
    render "show", status: status
  rescue User::FacebookProvider::AuthenticationError
    @errors = [{ status: 401, title: "Oooops, man, facebook doesn't care about you." }]
    render "errors", status: 401
  end

end
