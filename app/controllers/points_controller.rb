class PointsController < ApplicationController

  def index
    @points = Point.all
    render json: @points if stale?(@points.order("updated_at desc").first.updated_at)
  end

end
