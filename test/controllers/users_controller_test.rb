require "test_helper"

class UsersControllerTest < ActionController::TestCase

  context "authentication" do

    context "with a user created from authorization code" do

      setup do
        @user = FactoryGirl.create(:user)
        User.stubs(:create_from_authorization_code).with("1234").returns(@user)
      end

      should "return user" do
        post :login, authorization_code: "1234", format: "json"
        assert_response :success
        assert_not_nil assigns(:user)

        body = JSON.parse(@response.body)
        assert_equal @user.id, body["user"]["id"]
        assert_equal @user.email, body["user"]["email"]
        assert_equal @user.token, body["user"]["token"]
      end

    end

    context "with an invalid build from authorization code" do

      setup do
        @user = FactoryGirl.build(:user, email: nil)
        @user.save
        User.stubs(:create_from_authorization_code).with("1234").returns(@user)
      end

      should "communicate validation error" do
        post :login, authorization_code: "1234", format: "json"

        assert_response 400
        assert_not_nil assigns(:user)

        body = JSON.parse(@response.body)
        error = body["errors"].first
        assert_equal "Email can't be blank", error["title"]
        assert_equal 400, error["status"]
      end

    end

    context "when facebook authorization raises an exception" do

      setup do
        User.stubs(:create_from_authorization_code).with("1234").raises(User::FacebookProvider::AuthenticationError)
      end

      should "communicate unauthorized error" do
        post :login, authorization_code: "1234", format: "json"

        assert_response 401
        assert_nil assigns(:user)

        body = JSON.parse(@response.body)
        error = body["errors"].first
        assert_equal "Oooops, man, facebook doesn't care about you.", error["title"]
        assert_equal 401, error["status"]
      end

    end

  end

end
