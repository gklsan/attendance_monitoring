require 'test_helper'

class EmptestsControllerTest < ActionController::TestCase
  setup do
    @emptest = emptests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emptests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emptest" do
    assert_difference('Emptest.count') do
      post :create, emptest: { aintime: @emptest.aintime, ecode: @emptest.ecode, name: @emptest.name, shift: @emptest.shift, sintime: @emptest.sintime }
    end

    assert_redirected_to emptest_path(assigns(:emptest))
  end

  test "should show emptest" do
    get :show, id: @emptest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emptest
    assert_response :success
  end

  test "should update emptest" do
    patch :update, id: @emptest, emptest: { aintime: @emptest.aintime, ecode: @emptest.ecode, name: @emptest.name, shift: @emptest.shift, sintime: @emptest.sintime }
    assert_redirected_to emptest_path(assigns(:emptest))
  end

  test "should destroy emptest" do
    assert_difference('Emptest.count', -1) do
      delete :destroy, id: @emptest
    end

    assert_redirected_to emptests_path
  end
end
