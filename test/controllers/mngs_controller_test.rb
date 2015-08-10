require 'test_helper'

class MngsControllerTest < ActionController::TestCase
  setup do
    @mng = mngs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mngs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mng" do
    assert_difference('Mng.count') do
      post :create, mng: { no: @mng.no, question: @mng.question, yes: @mng.yes }
    end

    assert_redirected_to mng_path(assigns(:mng))
  end

  test "should show mng" do
    get :show, id: @mng
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mng
    assert_response :success
  end

  test "should update mng" do
    patch :update, id: @mng, mng: { no: @mng.no, question: @mng.question, yes: @mng.yes }
    assert_redirected_to mng_path(assigns(:mng))
  end

  test "should destroy mng" do
    assert_difference('Mng.count', -1) do
      delete :destroy, id: @mng
    end

    assert_redirected_to mngs_path
  end
end
