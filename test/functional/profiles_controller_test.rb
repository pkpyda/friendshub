require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:praveen).profile_name
    assert_response :success
  end

  test "should get not found if profile_name not exist" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "should assign statuses and user variables" do
  	get :show, id: users(:praveen).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "should display only user statuses" do
  	get :show, id: users(:praveen).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:praveen),status.user
  	end
  end

end
