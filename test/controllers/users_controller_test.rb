require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    setup do
        @user = users(:fred)
        sign_in @user
    end

    test "should show user" do
        get :show, id: @user
        assert_response :success
    end

    test "should get edit" do
        get :edit, id: @user
        assert_response :success
    end

    # test "should update user" do
    #     get :update, id: @user, user: { email: @user.email, password: @user.password }
    #     assert_redirected_to user_path(assigns(:user))
    # end

    test "should destroy user" do
        assert_difference('User.count', -1) do
            delete :destroy, id: @user
        end

        assert_redirected_to new_user_session_path
    end

    # test user adding vice to their profile

end