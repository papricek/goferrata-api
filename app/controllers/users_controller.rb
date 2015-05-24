class UsersController < ApplicationController

  def login
    @user = User.create_from_authorization_code(params[:authorization_code])
    if @user.errors.blank?
      render "show", status: 200
    else
      @errors = formatted_errors(@user)
      render "errors", status: 400
    end
  rescue User::FacebookProvider::AuthenticationError
    @errors = [{ status: 401, title: "Oooops, man, facebook doesn't care about you." }]
    render "errors", status: 401
  end

  private

  def formatted_errors(user)
    user.errors.messages.map do |column, errors|
      {
        title: "#{column.to_s.humanize} #{errors.join(", ")}",
        status: 400
      }
    end
  end

end
