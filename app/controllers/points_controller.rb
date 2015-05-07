class PointsController < ApplicationController

  def index
    @points = Point.all
    render json: @points if stale?(@points)
  end

end
