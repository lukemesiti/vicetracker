require 'test_helper'

class SubvicesControllerTest < ActionController::TestCase
    setup do
        @user = users(:fred)
        sign_in @user
        
        @subvice = subvices(:freds_subvice)
    end

    # test "should get new" do
    #     get :new
    #     assert_response :success
    # end

end