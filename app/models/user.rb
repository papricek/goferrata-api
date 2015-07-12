class User < ActiveRecord::Base

  # Callbacks
  before_validation :set_token, on: :create

  # Validations
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :token, presence: true

  # Other
  serialize :info, Hash

  def self.create_from_authorization_code(authorization_code)

    provider = User::FacebookProvider.new(authorization_code)

    User.find_or_initialize_by(email: provider.info[:email]).tap do |user|
      user.first_name = provider.info[:first_name]
      user.last_name = provider.info[:last_name]
      user.info = provider.info
      user.access_token = provider.access_token
      user.access_token_updated_at = Time.zone.now

      user.save
    end
  end

  private

  def set_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end

end
