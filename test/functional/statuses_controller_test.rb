require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should redirect to  login page if user not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "get new status if logged in" do
    sign_in users(:praveen)
    get :new
    assert_response :success
  end

  test "should redirect to login page if not logged in" do
    post :create, status: {content: "hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status" do
    sign_in users(:praveen)
    assert_difference('Status.count') do
      post :create, status: { content: @status.content}
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should create status for logged in user only" do
    sign_in users(:praveen)
    assert_difference('Status.count') do
      post :create, status: { content: @status.content, user_id: users(:akhil).id}
    end

    assert_redirected_to status_path(assigns(:status))
    assert_equal users(:praveen).id, assigns(:status).user_id
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should redirect to login page when user not logged in to edit" do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit" do
    sign_in users(:praveen)
    get :edit, id: @status
    assert_response :success
  end

  test "should redirect to login page when user not logged in to update" do
    put :update, id: @status, status: {content: "again hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update status only if user logged in" do
    sign_in users(:praveen)
    put :update, id: @status, status: { content: @status.content}
    assert_redirected_to status_path(assigns(:status))
  end

  test "should update status for curren user logged in" do
    sign_in users(:praveen)
    put :update, id: @status, status: { content: @status.content,user_id: users(:akhil).id}
    assert_redirected_to status_path(assigns(:status))
    assert_equal users(:praveen).id, assigns(:status).user_id
  end

  test "should not update the status if nothing has changed" do
    sign_in users(:praveen)
    put :update, id: @status
    assert_redirected_to status_path(assigns(:status))
    assert_equal users(:praveen).id, assigns(:status).user_id
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
