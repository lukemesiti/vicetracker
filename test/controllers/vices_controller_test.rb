require 'test_helper'

class VicesControllerTest < ActionController::TestCase
    setup do 
        @user = users(:fred)
        sign_in @user

        @vice = vices(:freds_vice)
    end

    test "should get index" do
        get :index
        assert_response :success
    end

    test "should get new" do
        get :new
        assert_response :success
    end

end