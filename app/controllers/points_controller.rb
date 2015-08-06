class PointsController < ApplicationController

  def index
    @points = Point.includes(comments: :user)
    fresh_when Point.order("updated_at asc").last.updated_at
  end

end
