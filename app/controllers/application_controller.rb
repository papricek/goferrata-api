class ApplicationController < ActionController::Base

  layout false

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def formatted_errors(active_record_object)
    active_record_object.errors.messages.map do |column, errors|
      {
        title: "#{column.to_s.humanize} #{errors.join(", ")}",
        status: 400
      }
    end
  end
end
