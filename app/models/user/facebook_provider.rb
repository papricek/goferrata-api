class User::FacebookProvider

  class AuthenticationError < StandardError; end

  def initialize(authorization_code)
    @authorization_code = authorization_code
  end

  def info
    @info ||= graph.get_object("me").deep_symbolize_keys!
  end

  def access_token
    @access_token ||= oauth.get_access_token(@authorization_code)
  rescue Koala::Facebook::OAuthTokenRequestError
    raise User::FacebookProvider::AuthenticationError
  end

  private

  def oauth
    Koala::Facebook::OAuth.new(Rails.application.secrets.facebook_app_id,
                               Rails.application.secrets.facebook_app_secret,
                               Rails.application.secrets.facebook_redirect_uri)
  end

  def graph
    Koala::Facebook::API.new(access_token)
  end

end
