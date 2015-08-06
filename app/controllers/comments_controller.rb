class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [ :create ]

  def create
    @comment = point.comments.build(point_params)
    if @comment.save
      render "show", status: 201
    else
      @errors = formatted_errors(@comment)
      render "errors", status: 400
    end
  end

  private

  def authenticate_user!
    authenticate_or_request_with_http_token do |token, options|
      @user = User.where(token: token).first
    end
  end

  def point_params
    params.require(:comment).permit(:text).merge(user_id: @user.id)
  end

  def point
    @point ||= Point.find(params[:point_id])
  end

end
