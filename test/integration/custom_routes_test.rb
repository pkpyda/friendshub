require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "check /register response is success" do
  	get '/register'
  	assert_response :success
  end

  test "check /login response is success" do
  	get '/login'
  	assert_response :success
  end

  test "check /logout redirect to  root" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end

  test "check /profile_name response is success" do
    get '/praveenkumar'
    assert_response :success
  end

end
