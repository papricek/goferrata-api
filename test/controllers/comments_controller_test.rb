require "test_helper"

class CommentsControllerTest < ActionController::TestCase

  context "with an existing point" do

    setup do
      @point = FactoryGirl.create(:point)
    end

    context "without a user" do

      should "just return 301" do
        assert_no_difference "Comment.count" do
          post :create, point_id: @point.id, comment: { text: "Fakin krejzy" }
        end

        assert_response :unauthorized
      end
    end

    context "with a user" do

      setup do
        @user = FactoryGirl.create(:user)
        authenticate_request_for_user(@user)
      end

      should "add a comment" do
        post :create, point_id: @point.id, comment: { text: "Fakin krejzy" }

        assert_response :success
        assert_not_nil assigns(:comment)
        assert_equal "Fakin krejzy", assigns(:comment).text
        assert_equal @point, assigns(:comment).point
      end

    end
  end
end
