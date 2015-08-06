class Comment < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :point, touch: true

  def user_name
    user.name
  end

end
