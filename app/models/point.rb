class Point < ActiveRecord::Base

  # Associations
  has_many :comments

end
